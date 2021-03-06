function varargout = Lissajous_3D_GUI(varargin)
% LISSAJOUS_3D_GUI M-file for Lissajous_3D_GUI.fig
%      LISSAJOUS_3D_GUI, by itself, creates a new LISSAJOUS_3D_GUI or raises the existing
%      singleton*.
%
%      H = LISSAJOUS_3D_GUI returns the handle to a new LISSAJOUS_3D_GUI or the handle to
%      the existing singleton*.
%
%      LISSAJOUS_3D_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LISSAJOUS_3D_GUI.M with the given input arguments.
%
%      LISSAJOUS_3D_GUI('Property','Value',...) creates a new LISSAJOUS_3D_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Lissajous_3D_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Lissajous_3D_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Lissajous_3D_GUI

% Last Modified by GUIDE v2.5 06-Apr-2015 09:54:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Lissajous_3D_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Lissajous_3D_GUI_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before Lissajous_3D_GUI is made visible.
function Lissajous_3D_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Lissajous_3D_GUI (see VARARGIN)

% Choose default command line output for Lissajous_3D_GUI
global t;
global delay;
global delay2;
global amp1;
global amp2;
global amp3;
global slowness;
global ii;
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Lissajous_3D_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t;
global delay;
global delay2;
global amp1;
global amp2;
global amp3;
global slowness;
global ii;

ii=1;
t=linspace(-pi,pi,10000);
slowness=100;

amp1=str2double(get(handles.edit_ratioA,'String'));
amp2=str2double(get(handles.edit_ratioB,'String'));
amp3=str2double(get(handles.edit_ratioC,'String'));

delay=eval(get(handles.edit_delayB,'String'));
delay2=eval(get(handles.edit_delayC,'String'));

while ii>0 && get(handles.togglebutton1,'Value')
    
    A=amp1*sin(amp1*2*pi*1*(ii/slowness));
    B=amp2*sin(amp2*2*pi*1*(ii/slowness)+delay);
    C=amp3*sin(amp3*2*pi*1*(ii/slowness)+delay2);
    sin_graph=amp1*sin(amp1*2*pi*1*(t+ii/slowness));
    cos_graph=amp2*sin(amp2*2*pi*1*(t+ii/slowness)+delay);
    third_graph=amp3*sin(amp3*2*pi*1*(t+ii/slowness)+delay2);
    
    axes(handles.axes1);
    plot(t,sin_graph);hold on;
    plot(0,A,'r*','Markersize',10);hold off;
    xlim([-pi pi]);ylim([-1 1]);
    grid on;
    axes(handles.axes2);
    T=num2str(delay);
    plot(t,cos_graph);hold on;
    xlim([-pi pi]);ylim([-1 1]);
    plot(0,B,'r*','MarkerSize',10);hold off;
    grid on;
    axes(handles.axes3);
    plot(t,third_graph);hold on;
    xlim([-pi pi]);ylim([-1 1]);
    plot(0,C,'r*','MarkerSize',10);hold off;
    grid on;
    axes(handles.axes4);
    plot3(sin_graph,cos_graph,third_graph);
    hold on;
    plot3(A,B,C,'r*','MarkerSize',10);hold off;
    grid on;
    pause(0.000001)
    
    ii=ii+1;
end






% --- Outputs from this function are returned to the command line.
function varargout = Lissajous_3D_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_ratioA_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ratioA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ratioA as text
%        str2double(get(hObject,'String')) returns contents of edit_ratioA as a double


% --- Executes during object creation, after setting all properties.
function edit_ratioA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ratioA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_ratioB_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ratioB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ratioB as text
%        str2double(get(hObject,'String')) returns contents of edit_ratioB as a double


% --- Executes during object creation, after setting all properties.
function edit_ratioB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ratioB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_ratioC_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ratioC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ratioC as text
%        str2double(get(hObject,'String')) returns contents of edit_ratioC as a double


% --- Executes during object creation, after setting all properties.
function edit_ratioC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ratioC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1



function edit_delayB_Callback(hObject, eventdata, handles)
% hObject    handle to edit_delayB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_delayB as text
%        str2double(get(hObject,'String')) returns contents of edit_delayB as a double


% --- Executes during object creation, after setting all properties.
function edit_delayB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_delayB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_delayC_Callback(hObject, eventdata, handles)
% hObject    handle to edit_delayC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_delayC as text
%        str2double(get(hObject,'String')) returns contents of edit_delayC as a double


% --- Executes during object creation, after setting all properties.
function edit_delayC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_delayC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
