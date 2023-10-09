import pygame
import math
import random
import sys
import time
from words import word_list
from pygame import mixer


# import and random word
def get_word():
    temp = random.choice(word_list)
    # word = "good"
    temp = temp.upper()
    # print(temp)
    return temp


# setting keyboard
def keyboard_set():
    temp = []
    for i in range(26):
        x = startx + startx * (i % 13)
        y = starty + (startx * (i // 13))
        temp.append([x, y, chr(A + i), True])
    return temp


# show guessed word
def word_dis():
    display_word = ""
    for letter in word:
        if letter in guessed:
            display_word += letter + " "
        else:
            display_word += "_ "
    text = WORD_FONT.render(display_word, True, RED)
    win.blit(text, (WIDTH / 2 - text.get_width() / 2, 550))


# import and random word
def check_get():
    check = 0
    for letter in word_set:
        if letter in guessed:
            check += 1
    return check


# show letter button and alphabet
def butt_dis():
    for letter in letters:
        x, y, ltr, visible = letter
        if visible:
            pygame.draw.circle(win, BLUE, (x, y), RADIUS)
            text = LETTER_FONT.render(ltr, True, WHITE)
            win.blit(text, (x - text.get_width() / 2, y - text.get_height() / 2))


# function for click letter button
def click():
    global start_game, start, total_point, cur
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            sys.exit()
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_ESCAPE:
                start_game = False
        if event.type == pygame.MOUSEBUTTONDOWN:
            m_x, m_y = pygame.mouse.get_pos()
            for letter in letters:
                x, y, ltr, visible = letter
                if visible:
                    dis = math.sqrt((x - m_x) ** 2 + (y - m_y) ** 2)
                    if dis < RADIUS:
                        letter[3] = False
                        guessed.append(ltr)
                        if ltr not in word:
                            start -= 2
                            bg_sound("bubbleClick.wav", 1, 0)
                        else:
                            total_point += 5
                            start += 5
                            bg_sound("correct.wav", 1, 0)
                            if start > time.time():
                                start = time.time()
    return start_game


# ending scene show point and last word
def display_message(message, score, last_word, time_spent):
    global bg
    pygame.time.delay(1000)
    bg_music('I_love_you_girl_voice.wav', 1, 0)
    bg = pygame.image.load("pic/endingUp.png")
    bg = pygame.transform.scale(bg, (800, 1000))
    win.blit(bg, (0, 0))
    pygame.display.update()
    pygame.time.delay(1000)

    textbox = pygame.image.load("pic/textbox.png")
    textbox = pygame.transform.scale(textbox, (800, 1000))
    win.blit(textbox, (0, -50))
    pygame.display.update()
    pygame.time.delay(500)

    text = WORD_FONT.render(message, True, RED_LIGHT)
    win.blit(text, (WIDTH/2 - text.get_width()/2, 665))
    pygame.display.update()
    pygame.time.delay(500)

    score_text = SCORE_END.render(score, True, BLACK)
    win.blit(score_text, (WIDTH / 2 - score_text.get_width() / 2, 740))
    pygame.display.update()
    pygame.time.delay(500)

    word_text = SCORE_END.render(last_word, True, BLACK)
    win.blit(word_text, (WIDTH / 2 - word_text.get_width() / 2, 780))
    pygame.display.update()
    pygame.time.delay(500)

    times = SCORE_END.render(time_spent, True, BLACK)
    win.blit(times, (WIDTH / 2 - times.get_width() / 2, 820))
    pygame.display.update()
    pygame.time.delay(4000)


# main loop for game
def main():
    fps = 60
    clock = pygame.time.Clock()

    global bg, start_game, cur, start, total_point
    run = True

    while run and cur < time_limit:
        clock.tick(fps)
        frame = 3

        cur = time.time()-start
        if cur > time_limit:
            cur = time_limit

        # click
        start_game = click()

        # BG generate
        if int(cur) % frame == 0 :
            bg = pygame.image.load("pic/bg" + str(int(cur) // frame) + ".png")
        # bg = pygame.image.load("bg16 8.png")
        win.blit(bg, (0, 0))

        # draw word
        word_dis()

        # check
        check = check_get()
        # print(check)

        # draw point
        points = POINTS_FONT.render("Score " + str(total_point), True, WHITE)
        win.blit(points, (5, 0))

        # draw water level
        if time_limit - cur <= 10:
            time_text = TEXT_FONT.render("Water Level " + str(int(cur)) + "/" + str(time_limit), True, (255, 30, 0))
            # warn_sound = mixer.Sound("BgSound/warn.wav")
            # warn_sound.set_volume(1)
            # warn_sound.play(-1)
        else:
            time_text = TEXT_FONT.render("Water Level " + str(int(cur)) + "/" + str(time_limit), True, WHITE)
        win.blit(time_text, (WIDTH / 2 - time_text.get_width() / 2, 900))

        # draw buttons
        butt_dis()

        pygame.display.update()

        # check for restart game
        # มีบัคตอนกด Esc ตอนเริ่มเกม 0 วิ
        if start_game == False:
            return start_game

        # check number of letter in word_set <-> number of letter in guessed word
        if check == len(word_set):
            pygame.time.delay(700)  # stop a sec for look the word
            # decrease water level
            start += 7
            if start > time.time():
                start = time.time()
            total_point += 20   # increase a score
            run = False
            return start_game

# import highest point
def best_score():
    file = open("best.txt", "r")
    read = int(file.read())
    return {read}


# collect highest point
def high_back(highest):
    open("best.txt", "w").close()
    file = open("best.txt", "w")
    file.write(highest)

# bg music function
def bg_music(music_name, volume, round):
    global music
    music = mixer.Sound("BgSound/" + str(music_name))
    music.set_volume(volume)
    music.play(round)


def bg_sound(sound_name, volume, round):
    s_name = mixer.Sound("BgSound/" + str(sound_name))
    s_name.set_volume(volume)
    s_name.play(round)


if __name__ == '__main__':
    # setup display
    pygame.init()
    mixer.init()

    # bg music
    bg_music('Girl laugh.wav', 0.5, 0)

    WIDTH, HEIGHT = 800, 1000
    win = pygame.display.set_mode((WIDTH, HEIGHT))
    pygame.display.set_caption("YanYan Game!")

    # button variables
    RADIUS = 23
    startx = WIDTH // 14
    starty = 750
    A = 65

    # fonts
    fonts = "Chalk Scratches Rough Bold.otf"
    LETTER_FONT = pygame.font.Font(fonts, 45)
    WORD_FONT = pygame.font.Font(fonts, 80)
    TITLE_FONT = pygame.font.Font(fonts, 80)
    POINTS_FONT = pygame.font.Font(fonts, 55)
    TEXT_FONT = pygame.font.Font(fonts, 80)
    SCORE_END = pygame.font.Font(fonts, 50)
    SCORE_MAIN = pygame.font.Font(fonts, 90)
    BEST_SCORE = pygame.font.Font(fonts, 60)

    # colors
    WHITE = (255, 255, 255)
    BLACK = (0, 0, 0)
    BLUE = (0, 0, 255)
    RED = (230, 0, 0)
    GREEN = (0, 97, 26)
    YELLOW = (252, 186, 3)
    ORANGE = (255, 106, 0)
    PINK = (255, 0, 255)
    RED_LIGHT = (255, 30, 30)

    time_limit = 120
    click_main = False
    total_point = None
    best_point = best_score()

    bg = pygame.image.load("pic/intro.png")
    bg = pygame.transform.scale(bg, (800, 1000))
    # for i in range(600):
    #     bg = pygame.transform.scale(bg, (800 - i, 1000 - i))
    #     win.blit(bg, (0, 0))
    #     pygame.display.update()
    #     i += 1
    win.blit(bg, (0, 0))
    pygame.display.update()
    pygame.time.delay(1500)

    bg_music('music begin.wav', 0.2, -1)

    while True:
        start_game = True
        bg = pygame.image.load("pic/bgbefore.png")
        win.blit(bg, (0, 0))
        # win.fill(WHITE)

        # draw title
        text = TITLE_FONT.render("YANYAN GAME!", True, PINK)
        win.blit(text, (WIDTH / 2 - text.get_width() / 2, 150))

        mx, my = pygame.mouse.get_pos()

        start_img = pygame.image.load("pic/start_butt.png")
        exit_img = pygame.image.load("pic/exit_butt.png")

        button_1 = start_img.get_rect(topleft=(445, 710))
        button_2 = exit_img.get_rect(topleft=(200, 710))

        # pygame.draw.rect(win, GREEN, button_1)
        win.blit(start_img, (445, 710))
        # pygame.draw.rect(win, RED, button_2)
        win.blit(exit_img, (200, 710))

        # start click
        if button_1.collidepoint((mx, my)):
            if click_main:
                bg_sound("mainClick.wav", 1, 0)

                total_point = 0
                start = time.time()
                begin = time.time()
                cur = time.time() - start

                # stop music and generate new music
                # music.stop()
                # bg_music('Odo.wav', 0.02, -1)

                while cur < time_limit and start_game:
                    letters = keyboard_set()
                    guessed = []
                    word = get_word()
                    word_set = set(word)
                    start_game = main()
                total_time = time.time() - begin
                best_point.add(total_point)
                high_back(str(max(best_point)))
                display_message("GAME OVER!!", "Total score: " + str(total_point), "Last Word: " + '"' + word + '"', "Time spent: " + str(int(total_time)) + " sec.")


        # exit click
        if button_2.collidepoint((mx, my)):
            if click_main:
                bg_sound("mainClick.wav", 1, 0)
                pygame.time.delay(300)
                pygame.quit()
                sys.exit()

        # main game click
        click_main = False
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                sys.exit()
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_ESCAPE:
                pygame.quit()
        if event.type == pygame.MOUSEBUTTONDOWN:
            if event.button == 1:
                click_main = True

        # generate last point
        if total_point is None:
            pass
        elif total_point >= 0:
            last = SCORE_MAIN.render("Last score: " + str(total_point), True, BLACK)
            win.blit(last, (WIDTH / 2 - last.get_width() / 2, 510))

        # generate highest point
        best = BEST_SCORE.render("Highest score: " + str(max(best_point)), True, RED)
        win.blit(best, (WIDTH / 2 - best.get_width() / 2, 590))

        pygame.display.update()
