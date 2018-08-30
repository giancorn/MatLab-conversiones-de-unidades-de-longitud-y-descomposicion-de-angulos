function varargout = D_ANGULO(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @D_ANGULO_OpeningFcn, ...
                   'gui_OutputFcn',  @D_ANGULO_OutputFcn, ...
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

function D_ANGULO_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = D_ANGULO_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function ang_grados_Callback(hObject, eventdata, handles)
Grados = str2double(get(hObject,'String'))
handles.Grados = Grados;
guidata(hObject, handles);

function ang_min_Callback(hObject, eventdata, handles)
Minutos= str2double(get(hObject,'String'))
handles.Minutos = Minutos;
guidata(hObject, handles);

function ang_seg_Callback(hObject, eventdata, handles)
Segundos=str2double(get(hObject,'String'))
handles.Segundos = Segundos;
guidata(hObject, handles);

% --- Executes on button press in CALCULAR_ANG.
function CALCULAR_ANG_Callback(hObject, eventdata, handles)
Grados  = handles.Grados;
Minutos = handles.Minutos;
Segundos= handles.Segundos;

if(Minutos ==0 && Segundos == 0)
    G= floor(Grados);
    M= floor((Grados-G)*60)
    S= ((Grados-G)*60-M)*60
else
    G=Grados+(Minutos+Segundos/60)/60
    M=0
    S=0
end

set(handles.ang_grados,'String',strcat(num2str(G),'°'));
set(handles.ang_min,'String',strcat(num2str(M),'´'));
set(handles.ang_seg,'String',strcat(num2str(S),'´´'));
