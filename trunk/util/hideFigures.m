function hideFigures()
    
    
    set(0, 'defaultFigureVisible', 'off');
    set(0, 'defaultAxesVisible', 'off');
    
    tdir = tempdir();
    fullpath = fullfile(tdir, 'matlabShadow'); 
    if ~exist(fullpath, 'file');
        mkdir(fullpath);
    end
    
    figfile = {'function h = figure(varargin)';   
            'h = builtin(''figure'', varargin{:}, ''visible'', ''off'');';
            'end'};
        
    axesfile = {'function h = axes(varargin)';   
            'h = builtin(''axes'', varargin{:}, ''visible'', ''off'');';
            'end'};    
    
    writeText(figfile, fullfile(fullpath, 'figure.m'));
    writeText(axesfile, fullfile(fullpath, 'axes.m'));
    warning('off', 'MATLAB:dispatcher:nameConflict')
    providePath(fullpath);
    
    
   
    
 
end