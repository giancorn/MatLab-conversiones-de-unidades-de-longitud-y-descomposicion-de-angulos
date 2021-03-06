function varargout = CONVERTIDOR(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CONVERTIDOR_OpeningFcn, ...
                   'gui_OutputFcn',  @CONVERTIDOR_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function CONVERTIDOR_OpeningFcn(hObject, eventdata, handles, varargin)
axes(handles.axes2);
path1 = 'unmsm.png';
imag1 = imread(path1);
imshow(imag1);

axes(handles.axes1);
path2 = 'mate.png';
imag2 = imread(path2);
imshow(imag2);
handles.output = hObject;
guidata(hObject, handles);

function varargout = CONVERTIDOR_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function angulo_Callback(hObject, eventdata, handles)
uicontrol(D_ANGULO);

function LONGITUD_Callback(hObject, eventdata, handles)
uicontrol(CONV_LONGITUD);
