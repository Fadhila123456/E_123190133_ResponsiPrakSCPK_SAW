function varargout = SAW_123190133_FadhilaTsaniNA(varargin)
% SAW_123190133_FADHILATSANINA MATLAB code for SAW_123190133_FadhilaTsaniNA.fig
%      SAW_123190133_FADHILATSANINA, by itself, creates a new SAW_123190133_FADHILATSANINA or raises the existing
%      singleton*.
%
%      H = SAW_123190133_FADHILATSANINA returns the handle to a new SAW_123190133_FADHILATSANINA or the handle to
%      the existing singleton*.
%
%      SAW_123190133_FADHILATSANINA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SAW_123190133_FADHILATSANINA.M with the given input arguments.
%
%      SAW_123190133_FADHILATSANINA('Property','Value',...) creates a new SAW_123190133_FADHILATSANINA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SAW_123190133_FadhilaTsaniNA_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SAW_123190133_FadhilaTsaniNA_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SAW_123190133_FadhilaTsaniNA

% Last Modified by GUIDE v2.5 26-Jun-2021 08:12:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SAW_123190133_FadhilaTsaniNA_OpeningFcn, ...
                   'gui_OutputFcn',  @SAW_123190133_FadhilaTsaniNA_OutputFcn, ...
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


% --- Executes just before SAW_123190133_FadhilaTsaniNA is made visible.
function SAW_123190133_FadhilaTsaniNA_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SAW_123190133_FadhilaTsaniNA (see VARARGIN)

% Choose default command line output for SAW_123190133_FadhilaTsaniNA
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SAW_123190133_FadhilaTsaniNA wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SAW_123190133_FadhilaTsaniNA_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opts = detectImportOptions('datarumah_saw_123190133.xlsx');
opts.SelectedVariableNames = ([1,3:8]);
data = readtable('datarumah_saw_123190133.xlsx',opts);
dataa = table2cell(data);
set(handles.uitable1,'data',dataa);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uitable1,'data','');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opts = detectImportOptions('datarumah_saw_123190133.xlsx');
opts.SelectedVariableNames = (3:8);
x = readmatrix('datarumah_saw_123190133.xlsx',opts);
k=[0,1,1,1,1,1];%nilai atribut, dimana 0= atribut biaya &1= atribut keuntungan
w=[0.30,0.20,0.23,0.10,0.07,0.10];% bobot untuk masing-masing kriteria


%tahapan 1. normalisasi matriks
[m n]=size (x); %matriks m x n dengan ukuran sebanyak variabel x (input)
R=zeros (m,n); %membuat matriks R, yang merupakan matriks kosong
for j=1:n,
    if k(j)==1, %statement untuk kriteria dengan atribut keuntungan
        R(:,j)=x(:,j)./max(x(:,j));
    else
        R(:,j)= min(x(:,j))./x(:,j);
    end;
end;

%tahapan kedua, proses perangkingan
for i=1:m,
 V(i)= sum(w.*R(i,:));
end;

Vtranspose=V.';
Vtranspose=num2cell(Vtranspose);
opts = detectImportOptions('datarumah_saw_123190133.xlsx');
opts.SelectedVariableNames = (2);
data1 = readtable('datarumah_saw_123190133.xlsx',opts);
data2 = table2cell(data1);
data3 =[data2 Vtranspose];
data3 = sortrows(data3,-2);
data3 = data3(1:20,1);

set(handles.uitable2, 'data', data3);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uitable2,'data','');
