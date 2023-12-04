function sorted_vals = sort_inputs(varargin)
    if nargin < 3 || nargin > 6
        error('Invalid number of input arguments');
    end

    sorted_vals = sort([varargin{:}]);
end