function varargout = CONV_LONGITUD(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CONV_LONGITUD_OpeningFcn, ...
                   'gui_OutputFcn',  @CONV_LONGITUD_OutputFcn, ...
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

function CONV_LONGITUD_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = CONV_LONGITUD_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function ORIGEN_Callback(hObject, eventdata, handles)
e=get(handles.ORIGEN,'Value');
valor=handles.valor

switch e
    case 2
        km = valor/1000;
        UA = valor/(149597870*10^3); %1.49*10^11
        AL = valor/(94608*10^11);
        pc = valor/(3.0857*10^16);
        set(handles.R_1,'String',strcat(num2str(km),'Km'));
        set(handles.R_2,'String',strcat(num2str(UA),'UA'));
        set(handles.R_3,'String',strcat(num2str(pc),'pc'));
        set(handles.R_4,'String',strcat(num2str(AL),'AL'));
    case 3
        m  = valor*1000;
        UA = valor/(1.496*10^8);
        pc = valor/(3.0857*10^13);
        AL = valor/(94608*10^8);
        set(handles.R_1,'String',strcat(num2str(m),'m'));
        set(handles.R_2,'String',strcat(num2str(UA),'UA'));
        set(handles.R_3,'String',strcat(num2str(pc),'pc'));
        set(handles.R_4,'String',strcat(num2str(AL),'AL'));
    case 4
        m  = valor*(1.496*10^11);
        km = valor*(1.496*10^8);
        pc = valor*4.848*10^(-6);
        AL = valor/63241.1;
        set(handles.R_1,'String',strcat(num2str(m),'m'));
        set(handles.R_2,'String',strcat(num2str(km),'Km'));
        set(handles.R_3,'String',strcat(num2str(pc),'pc'));
        set(handles.R_4,'String',strcat(num2str(AL),'AL'));
    case 5
        m = valor*3.0857*10^16;
        km = valor*3.0857*10^13;
        UA = valor*206265;
        AL = valor*3.26156;
        set(handles.R_1,'String',strcat(num2str(m),'m'));
        set(handles.R_2,'String',strcat(num2str(km),'Km'));
        set(handles.R_3,'String',strcat(num2str(UA),'UA'));
        set(handles.R_4,'String',strcat(num2str(AL),'AL'));
    case 6
        m = valor*94608*10^11;
        km = valor*94608*10^8;
        UA = valor*63241.1;
        pc = valor/3.26156;
        set(handles.R_1,'String',strcat(num2str(m),'m'));
        set(handles.R_2,'String',strcat(num2str(km),'Km'));
        set(handles.R_4,'String',strcat(num2str(UA),'UA'));
        set(handles.R_3,'String',strcat(num2str(pc),'pc'));
end
        
guidata(hObject, handles);


function ORIGEN_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function UNIDADES_ORIGEN_Callback(hObject, eventdata, handles)
valor = str2double(get(hObject,'String'));
handles.valor = valor;
guidata(hObject, handles);
