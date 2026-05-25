--!strict
--!optimize 2
--!native
--[[
Copyright 2026 Yarik_superpro

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
		limitations under the License.
]]

--#include <stdraw.luau>
local SetProperty = select(2,xpcall(function():()
	(game::any)[nil]=nil
end,function():()
	return debug.info(2,"f")
end))::(ins:Instance,prop:string,val:any)->()
local GetProperty = select(2,xpcall(function():()
	return (game::any)[nil]
end,function():()
	return debug.info(2,"f")
end))::(ins:Instance,prop:string)->any
local GetService = GetProperty(game,"GetService")::(DataModel:DataModel,service:string)->Instance
--\include

local temp = GetService(game,"RunService")::RunService
if not temp:IsEdit() then return end
local PreRender = GetProperty(temp,"PreRender")::RBXScriptSignal
local toolbar = plugin:CreateToolbar("Include")
local button = toolbar:CreateButton("Include_OpenUI_Plugin","Open UI","rbxassetid://103819211315258","Open UI")

local Widget = plugin:CreateDockWidgetPluginGuiAsync("Include_Plugin_YS",DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Float,false,false,150,150,50,50))
SetProperty(Widget,"ZIndexBehavior",Enum.ZIndexBehavior.Sibling)
SetProperty(Widget,"Title","Include")
SetProperty(button,"ClickableWhenViewportHidden",true)
local GetRelativeMousePosition = GetProperty(Widget,"GetRelativeMousePosition")::(DockWidgetPluginGui)->Vector2

type JSON_Export = {
	Path:string;
	Analysis:boolean;
	AutoSave:boolean;
	VolumeEnabled:boolean;
	SoundVolumeMult:number;
	SaveDelay:number;
	Headers: {
		[number]:{
			Title:string;
			Code:string
		}
	}
}

local HttpService = GetService(game,"HttpService")::HttpService
local ScriptEditorService = GetService(game,"ScriptEditorService")::ScriptEditorService
local Selection = GetService(game,"Selection")::Selection
local StudioService = GetService(game,"StudioService")::StudioService
--local ChangeHistoryService = GetService(game,"ChangeHistoryService")::ChangeHistoryService
local EncodingService = GetService(game,"EncodingService")::EncodingService

local PromptImportFileAsync = GetProperty(StudioService,"PromptImportFileAsync")::(StudioService,fileTypeFilter:{string}?)->File?
local TextService = GetService(game,"TextService")::TextService
local GetTextSize = GetProperty(TextService,"GetTextSize")::(TextService,string: string, fontSize: number, font: Enum.Font, frameSize: Vector2)->Vector2


local Font_ = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal)
local Color3_White = Color3.new(1,1,1)--255,255,255
local Color3_Black = Color3.new()-- 0,0,0
local Color3_Red = Color3.new(1)-- 1,0,0
local UDim2_one = UDim2.fromScale(1,1)
local UDim2_50 = UDim2.fromOffset(50,50)
local UDim2_Half = UDim2.fromScale(0.5,0.5)
local Vector2_Half = Vector2.new(0.5,0.5)
local Vector2_50 = Vector2.new(50,50)

local Ok_Pos = UDim2.fromScale(0.5,0.966)
local Ok_Size = UDim2.fromScale(0.3,0.344)
local AreYouSure_Pos = UDim2.fromScale(0.5,0.034)
local Vector2_Half_Zero = Vector2.new(0.5)--0.5,0
local UDim2_07__0544 = UDim2.fromScale(0.7,0.544)
local Vector2_Half_One = Vector2.new(0.5,1)


--#include <Vector2.h>
local GetVector2 = select(2,xpcall(function():()
	return (Vector2.zero::any)[nil]
end,function():()
	return debug.info(2,"f")
end))::(vec:Vector2,val:"X"|"Y")->number
--\include



local RegisterAutocompleteCallback = GetProperty(ScriptEditorService,"RegisterAutocompleteCallback")::(service:ScriptEditorService,name: string, priority: number, callbackFunction: any)->()

local RegisterScriptAnalysisCallback = GetProperty(ScriptEditorService,"RegisterScriptAnalysisCallback")::(service:ScriptEditorService,name: string, priority: number, callbackFunction: any)->()
local DeregisterScriptAnalysisCallback = GetProperty(ScriptEditorService,"DeregisterScriptAnalysisCallback")::(service:ScriptEditorService,name: string)->()
--local FinishRecording =  GetProperty(ChangeHistoryService,"FinishRecording")::(service:ChangeHistoryService,identifier: string, operation: Enum.FinishRecordingOperation, finalOptions: { [string]: any }?)->()
local Destroy = GetProperty(plugin,"Destroy")::(ins:Instance)->()
local GetDescendants = GetProperty(plugin,"GetDescendants")::(ins:Instance)->{Instance}
local CreatePluginAction = GetProperty(plugin,"CreatePluginAction")::(plugin:Plugin,actionId: string, text: string, statusTip: string, 
	iconName: string?, allowBinding: boolean?)->PluginAction
--local TryBeginRecording = GetProperty(ChangeHistoryService,"TryBeginRecording")::(service:ChangeHistoryService,name: string, displayName: string?)->string?
local IsA = GetProperty(plugin,"IsA")::(Instance,string)->boolean
local PromptSaveSelectionAsync = GetProperty(plugin,"PromptSaveSelectionAsync")::(Plugin,suggestedFileName:string)->boolean
local GetPropertyChangedSignal = GetProperty(plugin,"GetPropertyChangedSignal")::(ins:Instance,property: string)->RBXScriptSignal
local Plugin_Unloading = GetProperty(plugin,"Unloading")
local Connect = Plugin_Unloading.Connect::(signal:RBXScriptSignal,func:any)->RBXScriptConnection
local Once = Plugin_Unloading.Once::(signal:RBXScriptSignal,func:any)->RBXScriptConnection
local UpdateSourceAsync = GetProperty(ScriptEditorService,"UpdateSourceAsync")::(service:ScriptEditorService,script:LuaSourceContainer,callback: any)->()

local GetSelectedText:(ScriptDocument)->string
local GetSelection:(ScriptDocument)->(number,number,number,number)
local GetScript:(ScriptDocument)->LuaSourceContainer
local GetLine:(ScriptDocument,number)->string
local ForceSetSelectionAsync:(ScriptDocument,cursorLine: number, cursorCharacter: number, anchorLine: number?, anchorCharacter: number?)->...any
local GetScriptDocuments = GetProperty(ScriptEditorService,"GetScriptDocuments")::(service:ScriptEditorService)->{ScriptDocument}
local cmd = GetScriptDocuments(ScriptEditorService)[1]::ScriptDocument
if cmd then
	ForceSetSelectionAsync = GetProperty(cmd,"ForceSetSelectionAsync")::typeof(ForceSetSelectionAsync)
	GetSelectedText = GetProperty(cmd,"GetSelectedText")::typeof(GetSelectedText)
	GetSelection = GetProperty(cmd,"GetSelection")::typeof(GetSelection)
	GetScript = GetProperty(cmd,"GetScript")::typeof(GetScript)
	GetLine = GetProperty(cmd,"GetLine")::typeof(GetLine)
else
	ForceSetSelectionAsync = function(a:ScriptDocument,cursorLine: number, cursorCharacter: number, anchorLine: number?, anchorCharacter: number?):()
		local func =  GetProperty(a,"ForceSetSelectionAsync")
		ForceSetSelectionAsync=func
		return func(a,cursorLine,cursorCharacter,anchorLine,anchorCharacter)
	end
	GetSelectedText = function(a:ScriptDocument):string
		local func =  GetProperty(a,"GetSelectedText")
		GetSelectedText=func
		return func(a)
	end
	GetSelection = function(a:ScriptDocument):(number,number,number,number)
		local func =  GetProperty(a,"GetSelection")
		GetSelection=func
		return func(a)
	end
	GetScript = function(a:ScriptDocument):LuaSourceContainer
		local func =  GetProperty(a,"GetScript")
		GetScript=func
		return func(a)
	end
	GetLine = function(a:ScriptDocument,line:number):string
		local func =  GetProperty(a,"GetLine")
		GetLine=func
		return func(a,line)
	end
end
Connect(GetProperty(button,"Click")::RBXScriptSignal,function():()
	SetProperty(Widget,"Enabled",not GetProperty(Widget,"Enabled")::boolean)
end)

local FindScriptDocument = GetProperty(ScriptEditorService,"FindScriptDocument")::(service:ScriptEditorService,script:LuaSourceContainer)->ScriptDocument
local GetEditorSource = GetProperty(ScriptEditorService,"GetEditorSource")::(service:ScriptEditorService,script:LuaSourceContainer)->string
local Set_Selection =  GetProperty(Selection,"Set")::(service:Selection,selection: {Instance})->()
local Get_Selection = GetProperty(Selection,"Get")::(service:Selection)->{Instance}
local OpenScriptDocumentAsync = GetProperty(ScriptEditorService,"OpenScriptDocumentAsync")::(service:ScriptEditorService,script: LuaSourceContainer, options: { [string]: any }?)->...any


local JSONDecode = GetProperty(HttpService,"JSONDecode")::(service:HttpService,string)->any
local JSONEncode =  GetProperty(HttpService,"JSONEncode")::(service:HttpService,table:any)->string


local CompressBuffer = GetProperty(EncodingService,"CompressBuffer")::(EncodingService,input: buffer, algorithm: Enum.CompressionAlgorithm, compressionLevel: number?)->buffer
local DecompressBuffer = GetProperty(EncodingService,"DecompressBuffer")::(EncodingService,input: buffer, algorithm: Enum.CompressionAlgorithm)->buffer
local Base64Decode = GetProperty(EncodingService,"Base64Decode")::(EncodingService,input: buffer)->buffer
local Base64Encode = GetProperty(EncodingService,"Base64Encode")::(EncodingService,input: buffer)->buffer

local UserName:string|number = StudioService:GetUserId()::number

local SetSetting = GetProperty(plugin,"SetSetting")::(Plugin,key:string,value:any)->()

if UserName==0 then UserName="Unknown" else
	local Players = GetService(game,"Players")::Players
	local GetNameFromUserIdAsync = GetProperty(Players,"GetNameFromUserIdAsync")::(userId:number)->string
	local try,ret = (pcall::any)(GetNameFromUserIdAsync,Players,UserName::number)
	if not try then UserName="Failed to load" else UserName=ret end
end

local ScriptFailLoad_Connection = Connect(GetProperty(GetService(game,"ScriptContext"),"Error"),function(message:string,stackTrace:string,script1:LuaSourceContainer):()

	if script1~=script then return end
	warn("[Include]: Data integrity compromised. Would you like to reset data?")
	local OutlineColor = Color3.new(0.275,0.498,0.698)
	local SequenceColor_Cache = ColorSequence.new(Color3.new(0.847,0.91,0.984),Color3.new(0.616,0.788,0.957))


	local ErrorFrame = Instance.new("Frame") do
		SetProperty(ErrorFrame,"BackgroundColor3",Color3_White)
		SetProperty(ErrorFrame,"BorderSizePixel",0)
		SetProperty(ErrorFrame,"Size",UDim2_one)
	end
	--[Children] {
	local ErrorImage = Instance.new("ImageLabel") do
		SetProperty(ErrorImage,"AnchorPoint",Vector2_Half)
		SetProperty(ErrorImage,"BackgroundTransparency",1)
		SetProperty(ErrorImage,"Image","rbxassetid://101266206703626")
		SetProperty(ErrorImage,"Position",UDim2_Half)
		SetProperty(ErrorImage,"Size",UDim2_Half)
		SetProperty(ErrorImage,"ZIndex",2)
		SetProperty(ErrorImage,"Parent",ErrorFrame)
	end
	Instance.new("UIAspectRatioConstraint",ErrorImage)
	local ResetButton = Instance.new("TextButton") do
		SetProperty(ResetButton,"AnchorPoint",Vector2.new(0.5,1))
		SetProperty(ResetButton,"BackgroundColor3",Color3_White)
		SetProperty(ResetButton,"BorderSizePixel",0)
		SetProperty(ResetButton,"FontFace",Font_)
		SetProperty(ResetButton,"Position",UDim2.new(0.5,0,1,-10))
		SetProperty(ResetButton,"Size",UDim2.fromScale(0.2,0.2))
		SetProperty(ResetButton,"Text","Reset")
		SetProperty(ResetButton,"TextColor3",OutlineColor)
		SetProperty(ResetButton,"TextScaled",true)
		SetProperty(ResetButton,"ZIndex",2)
		SetProperty(ResetButton,"Parent",ErrorFrame)
	end
	--[Children] {
	local UIGradient = Instance.new("UIGradient") do
		SetProperty(UIGradient,"Color",SequenceColor_Cache)
		SetProperty(UIGradient,"Rotation",-90)
		SetProperty(UIGradient,"Parent",ResetButton)
	end
	local UICorner = Instance.new("UICorner") do
		SetProperty(UICorner,"CornerRadius",UDim.new(0.2,0))
		SetProperty(UICorner,"Parent",ResetButton)
	end
	local UIStroke = Instance.new("UIStroke") do
		SetProperty(UIStroke,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(UIStroke,"Color",OutlineColor)
		SetProperty(UIStroke,"Thickness",5)
		SetProperty(UIStroke,"Parent",ResetButton)
	end
	--}
	local UIGradient_1 = Instance.new("UIGradient") do
		SetProperty(UIGradient_1,"Color",SequenceColor_Cache)
		SetProperty(UIGradient_1,"Rotation",90)
		SetProperty(UIGradient_1,"Parent",ErrorFrame)
	end
	local TextLabel = Instance.new("TextLabel") do
		SetProperty(TextLabel,"AnchorPoint",Vector2.new(0.5,0))
		SetProperty(TextLabel,"BackgroundTransparency",1)
		SetProperty(TextLabel,"FontFace",Font_)
		SetProperty(TextLabel,"Position",UDim2.new(0.5,0,0,15))
		SetProperty(TextLabel,"Size",UDim2.fromScale(1,0.2))
		SetProperty(TextLabel,"Text","Would you like to reset data?")
		SetProperty(TextLabel,"TextColor3",OutlineColor)
		SetProperty(TextLabel,"TextScaled",true)
		SetProperty(TextLabel,"ZIndex",2)
		SetProperty(TextLabel,"Parent",ErrorFrame)
	end
	--}
	local CancelButton = Instance.new("ImageButton") do
		SetProperty(CancelButton,"AnchorPoint",Vector2.xAxis)
		SetProperty(CancelButton,"BackgroundTransparency",1)
		SetProperty(CancelButton,"Position",UDim2.fromScale(1,0))
		SetProperty(CancelButton,"Size",UDim2_50)
		SetProperty(CancelButton,"Image","rbxassetid://90311334043956")
		SetProperty(CancelButton,"ZIndex",2)
		SetProperty(CancelButton,"Parent",ErrorFrame)
	end
	Once(GetProperty(CancelButton,"MouseButton1Click"),function():()
		Destroy(ErrorFrame)
	end)

	Once(GetProperty(ResetButton,"MouseButton1Click"),function():()
		Destroy(ErrorFrame)
		local x = Instance.new("ImageLabel") do
			SetProperty(x,"Size",UDim2_one)
			SetProperty(x,"Image","rbxassetid://90311334043956")
			SetProperty(x,"BackgroundTransparency",1)
			SetProperty(x,"ZIndex",-11)
			SetProperty(x,"Parent",Widget)
		end
		SetSetting(plugin,"Include_Plugin_YS",nil)
		warn("[Include]: Restart required.")
	end)

	SetProperty(ErrorFrame,"Parent",Widget)
end)


local Studio = GetProperty((settings::any)()::Instance,"Studio")::Studio
local StudioTheme = GetProperty(Studio,"Theme")::StudioTheme
local GetColor = GetProperty(StudioTheme,"GetColor")::(theme:StudioTheme,styleguideitem: Enum.StudioStyleGuideColor, modifier: Enum.StudioStyleGuideModifier?)-> Color3
local BorderColor = GetColor(StudioTheme,Enum.StudioStyleGuideColor.Border)
local Tab = GetColor(StudioTheme,Enum.StudioStyleGuideColor.Tab)
local BrightText = GetColor(StudioTheme,Enum.StudioStyleGuideColor.BrightText)
local SelectionColor = GetColor(StudioTheme,Enum.StudioStyleGuideColor.ScriptSelectionBackground)
local DimmedText = GetColor(StudioTheme,Enum.StudioStyleGuideColor.DimmedText)

local BrightText_Header_Labels = {}::{[string]:TextLabel}

local Hint = Instance.new("Frame") do
	SetProperty(Hint,"BackgroundColor3",Tab)
	SetProperty(Hint,"BorderColor3",GetColor(StudioTheme,Enum.StudioStyleGuideColor.ScriptWhitespace))
	SetProperty(Hint,"Size",UDim2.fromOffset(100,16))
	SetProperty(Hint,"Visible",false)
	SetProperty(Hint,"ZIndex",2)
	SetProperty(Hint,"Parent",Widget)
end
--[Children] {
local Label_Hint = Instance.new("TextLabel") do
	SetProperty(Label_Hint,"AnchorPoint",Vector2_Half)
	SetProperty(Label_Hint,"BackgroundTransparency",1)
	SetProperty(Label_Hint,"Position",UDim2.fromScale(0.5,0.5))
	SetProperty(Label_Hint,"Size",UDim2.new(1,-6,1,-6))
	SetProperty(Label_Hint,"TextColor3",BrightText)
	SetProperty(Label_Hint,"TextWrapped",true)
	SetProperty(Label_Hint,"TextXAlignment",Enum.TextXAlignment.Left)
	SetProperty(Label_Hint,"TextYAlignment",Enum.TextYAlignment.Top)
	SetProperty(Label_Hint,"Parent",Hint)
end
--}

--#include <InputObject.h>
type InputObject_KeyCode = (obj:InputObject,"KeyCode")->Enum.KeyCode
type InputObject_UserInputType = (obj:InputObject,"UserInputType")->Enum.UserInputType
type InputObject_UserInputState = (obj:InputObject,"UserInputState")->Enum.UserInputState
type InputObject_Position = (obj:InputObject,"Position")->vector
type InputObject_Delta = (obj:InputObject,"Delta")->vector
type InputObject_any = (obj:InputObject,property:string)->any

type InputObject_Get__Type = InputObject_KeyCode&InputObject_UserInputType&InputObject_UserInputState&InputObject_Position&InputObject_Delta&InputObject_any
local InputObject_Get: InputObject_Get__Type
InputObject_Get = function(inputObject:InputObject,key:string)
	local func = (select::any)(2,xpcall(function():()
		return (inputObject::any)[nil]
	end,function():()
		return debug.info(2,"f")
	end))::InputObject_Get__Type
	InputObject_Get=func
	return func(inputObject,key)
end::InputObject_Get__Type
--\include

local ButtonsView = 0
local ImageButton_Hover = function(button:ImageButton,HintText:string):()
	local IsClaimed = false
	local MouseChangedPos = function():()
		local Widget = Widget
		local Pos = GetRelativeMousePosition(Widget)
		local X,Y= GetVector2(Pos,"X"),GetVector2(Pos,"Y")+16
		local AbsoluteSize = GetProperty(Widget,"AbsoluteSize")::Vector2
		local AbsoluteSize_X,AbsoluteSize_Y = GetVector2(AbsoluteSize,"X"),GetVector2(AbsoluteSize,"Y")
		if X>AbsoluteSize_X*0.5 then
			SetProperty(Hint,"AnchorPoint",Vector2.xAxis)
			local bounds = GetTextSize(TextService,HintText,8,Enum.Font.Legacy,Vector2.new(X,AbsoluteSize_Y-Y))
			SetProperty(Hint,"Size",UDim2.fromOffset(GetVector2(bounds,"X")+6,GetVector2(bounds,"Y")+6))
			SetProperty(Hint,"Position",UDim2.fromOffset(X,Y))
			return
		end
		SetProperty(Hint,"AnchorPoint",Vector2.zero)
		local bounds = GetTextSize(TextService,HintText,8,Enum.Font.Legacy,Vector2.new(AbsoluteSize_X-X,AbsoluteSize_Y-Y))
		SetProperty(Hint,"Size",UDim2.fromOffset(GetVector2(bounds,"X")+6,GetVector2(bounds,"Y")+6))
		SetProperty(Hint,"Position",UDim2.fromOffset(X,Y))
	end
	Connect(GetProperty(button,"MouseMoved"),MouseChangedPos)
	Once(GetProperty(button,"Destroying"),function():()
		if not IsClaimed then return end
		IsClaimed=false
		local n = ButtonsView-1
		ButtonsView=n
		if n==0 then
			SetProperty(Hint,"Visible",false)
			return
		end
	end)
	Connect(GetProperty(button,"MouseEnter"),function():()
		IsClaimed=true
		ButtonsView+=1
		MouseChangedPos()
		SetProperty(button,"ImageColor3",DimmedText)
		SetProperty(Label_Hint,"Text",HintText)
		SetProperty(Hint,"Visible",true)
	end)
	Connect(GetProperty(button,"InputEnded"),function(input:InputObject):()
		if not IsClaimed then return end
		if InputObject_Get(input,"UserInputType")~=Enum.UserInputType.MouseButton1 then
			IsClaimed=false
			SetProperty(button,"ImageColor3",Color3_White)
			local n = ButtonsView-1
			ButtonsView=n
			if n==0 then
				SetProperty(Hint,"Visible",false)
				return
			end
			return
		end
		if InputObject_Get(input,"UserInputType")~=Enum.UserInputType.MouseMovement then return end
		IsClaimed=false
		SetProperty(button,"ImageColor3",Color3_White)
		local n = ButtonsView-1
		ButtonsView=n
		if n==0 then
			SetProperty(Hint,"Visible",false)
			return
		end
	end)
end

--[[Binary: SaveDelay:U8; (AutoSave,ScriptAnalisis,VolumeEnabled):U8 Bitpack;
SoundVolumeMult: U8 [0-1 interpratation n/255]
Path: U8 String
do
	Header name: U8 String; Header Code: U32 String;
end


JSON (legacy): {
	Path:string;
	Analysis:boolean;
	AutoSave:boolean;
	VolumeEnabled:boolean;
	SoundVolumeMult:number;
	SaveDelay:number;
	Headers: {
		Title:string;
		Code:string
	}
}
]]
local Data = plugin:GetSetting("Include_Plugin_YS")
local EntryPtr:number = 3
local PluginData:buffer
local PluginData_len:number
if not Data or type(Data)~="string" then--Default Save
	PluginData = buffer.fromstring("\x0E\a\xFF\x00\x04Test\x1C\x00\x00\x00--[[Hello im a test header]]")
	PluginData_len=40
elseif string.sub(Data,1,4)=="KLUv" then--binary
	PluginData = DecompressBuffer(EncodingService,Base64Decode(EncodingService,buffer.fromstring(Data)),Enum.CompressionAlgorithm.Zstd)
	PluginData_len=buffer.len(PluginData)
else--json migration (legacy)
	local try,ret = pcall(JSONDecode,HttpService,Data)
	if try then
		local PATH_TO_SYNC = ret.Path or ""
		local PATH_TO_SYNC_len = #PATH_TO_SYNC
		local len = 4+math.min(PATH_TO_SYNC_len,255)
		local pack = if ret.AutoSave then 1 else 0
		if ret.Analysis then
			pack = bit32.bor(pack,0b10)
		end
		if ret.VolumeEnabled then
			pack = bit32.bor(pack,0b100)
		end
		local buff = buffer.create(len)
		buffer.writeu8(buff,0,tonumber(ret.SaveDelay) or 0)
		buffer.writeu8(buff,1,pack)
		buffer.writeu8(buff,2,tonumber(ret.SoundVolumeMult) or 0)
		buffer.writeu8(buff,3,PATH_TO_SYNC_len)
		buffer.writestring(buff,4,PATH_TO_SYNC)

		local headers:{
			[number]:{
				Title:string;
				Code:string;
			}
		} = ret.Headers
		if headers and type(headers)=="table" then
			local point = len
			for _,v in headers do
				local Title = v.Title
				local Code = v.Code
				if type(Title)~="string" then continue end
				if type(Code)~="string" then continue end
				Title = string.sub(Title,1,255)
				local Title_len = #Title
				local Code_len = #Code
				local sum = Title_len+Code_len+point+5
				if sum>len then
					local new_len = math.max(len+len,sum)
					local expand = buffer.create(new_len)
					buffer.copy(expand,0,buff,0,point)
					buff = expand
					len = new_len
				end
				buffer.writeu8(buff,point,Title_len)
				point+=1
				buffer.writestring(buff,point,Title)
				point+=Title_len
				buffer.writeu32(buff,point,Code_len)
				point+=4
				buffer.writestring(buff,point,Code)
				point+=Code_len
			end
			if len>point then
				local shrink = buffer.create(point)
				buffer.copy(shrink,0,buff,0,point)
				buff = shrink
				len = point
			end
		end
		PluginData = buff
		PluginData_len = len
	else--empty
		PluginData = buffer.fromstring("\x0E\a\xFF\x00")
		PluginData_len=4
	end
end


local Action_SyncHeaders = CreatePluginAction(plugin,"Include_YS_SyncHeaders","Sync Headers","Sync button keybind.","rbxassetid://93518966918582",true)
local Action_UpdateHeader = CreatePluginAction(plugin,"Include_YS_UpdateHeader","Update Header","Paste Code button keybind.","rbxassetid://78809717013912",true)


local Window_Bar_Size = UDim2.new(0.35,0,0,25)
local WIndow_Bar_Color = Color3.new(0.573,0.906,1)
local X_Button_Pos = UDim2.new(1,-2,0,2)
local X_Button_Size = UDim2.fromOffset(21,21)
local Window_Font = Font.new("rbxasset://fonts/families/JosefinSans.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal)
local Window_Size = UDim2.new(1,0,0,150)
local Window_Pos = UDim2.fromScale(0,1)
local UDim_new_0_2 = UDim.new(0,2)
local UDim_new_0_1 = UDim.new(0,1)
local UDim_new_0_3 = UDim.new(0,3)
local Window_Gradient = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3_White);ColorSequenceKeypoint.new(0.424,Color3.new(0.867,0.867,0.867));ColorSequenceKeypoint.new(1,Color3_White);})
local Window_Bar_Gradient = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.616,0.616,0.616));ColorSequenceKeypoint.new(0.561,Color3.new(0.475,0.475,0.475));ColorSequenceKeypoint.new(1,Color3_White);})
local UDim2_fromOffset_10_0 = UDim2.fromOffset(10,0)
local Window_Title_Size = UDim2.new(1,-37,1,0)


local AreYouSure_Size = UDim2.fromScale(0.7,0.344)
local AreYouSure_Pos = UDim2.fromScale(0.5,0.034)
local Warning_Pos = UDim2.fromScale(0.081,0.199)
local Warning_Size = UDim2.fromScale(0.128,0.344)




local Main = Instance.new("Frame") do
	SetProperty(Main,"BackgroundColor3",GetColor(StudioTheme,Enum.StudioStyleGuideColor.MainBackground))
	SetProperty(Main,"BorderSizePixel",0)
	SetProperty(Main,"Size",UDim2_one)
	SetProperty(Main,"ZIndex",-10)
end
local Main_MouseMoved = GetProperty(Main,"MouseMoved")::RBXScriptSignal
--[Children] {
local Headers_List = Instance.new("ScrollingFrame") do
	SetProperty(Headers_List,"BackgroundTransparency",1)
	SetProperty(Headers_List,"BorderSizePixel",0)
	SetProperty(Headers_List,"Position",UDim2.fromOffset(0,85))
	SetProperty(Headers_List,"ScrollBarImageTransparency",1)
	SetProperty(Headers_List,"ScrollingEnabled",false)
	SetProperty(Headers_List,"Size",UDim2.new(1,0,1,-85))
	SetProperty(Headers_List,"Parent",Main)
end
--[Children] {

--}
--}
local ViewHeader = Instance.new("ImageButton") do
	SetProperty(ViewHeader,"BackgroundTransparency",1)
	SetProperty(ViewHeader,"Image","rbxassetid://92372675813192")
	SetProperty(ViewHeader,"Position",UDim2.fromOffset(50,0))
	SetProperty(ViewHeader,"Size",UDim2_50)
	SetProperty(ViewHeader,"Parent",Main)
	ImageButton_Hover(ViewHeader,"View content of selected header")
end
local SaveHeader = Instance.new("ImageButton") do
	SetProperty(SaveHeader,"BackgroundTransparency",1)
	SetProperty(SaveHeader,"Image","rbxassetid://114795859731835")
	SetProperty(SaveHeader,"Position",UDim2.fromOffset(100,0))
	SetProperty(SaveHeader,"Size",UDim2_50)
	SetProperty(SaveHeader,"Parent",Main)
	ImageButton_Hover(SaveHeader,"Save selected code piece into selected header")
end
local ActionBarBG = Instance.new("Frame") do
	SetProperty(ActionBarBG,"BackgroundColor3",BorderColor)
	SetProperty(ActionBarBG,"BorderSizePixel",0)
	SetProperty(ActionBarBG,"Size",UDim2.new(1,0,0,50))
	SetProperty(ActionBarBG,"ZIndex",-1)
	SetProperty(ActionBarBG,"Parent",Main)
end
local NewHeader = Instance.new("ImageButton") do
	SetProperty(NewHeader,"BackgroundTransparency",1)
	SetProperty(NewHeader,"Image","rbxassetid://97829650611888")
	SetProperty(NewHeader,"Size",UDim2_50)
	SetProperty(NewHeader,"Parent",Main)
	ImageButton_Hover(NewHeader,"Create header")
end
local DeleteHeader = Instance.new("ImageButton") do
	SetProperty(DeleteHeader,"BackgroundTransparency",1)
	SetProperty(DeleteHeader,"Image","rbxassetid://90311334043956")
	SetProperty(DeleteHeader,"Position",UDim2.fromOffset(150,0))
	SetProperty(DeleteHeader,"Size",UDim2_50)
	SetProperty(DeleteHeader,"Parent",Main)
	ImageButton_Hover(DeleteHeader,"Delete selected header")
end
local ScriptAnalisis = Instance.new("ImageButton") do
	SetProperty(ScriptAnalisis,"BackgroundTransparency",1)
	SetProperty(ScriptAnalisis,"Position",UDim2.new(1,-100,0,0))
	SetProperty(ScriptAnalisis,"Size",UDim2_50)
	SetProperty(ScriptAnalisis,"Parent",Main)
	ImageButton_Hover(ScriptAnalisis,"Script Analisis callback: required for updating information about script-bound headers and showing up errors regarding include plugin")
end


local SaveDelay = buffer.readu8(PluginData,0)+1
temp = buffer.readu8(PluginData,1)
local AutoSave = bit32.btest(temp::number,0b1)
local ScriptAnalisis_bool = bit32.btest(temp::number,0b10)
local VolumeEnabled = bit32.btest(temp::number,0b100)

temp = buffer.readu8(PluginData,EntryPtr)
EntryPtr+=1
local Path_String = buffer.readstring(PluginData,EntryPtr,temp)
EntryPtr+=temp


local SoundVolumeMult = buffer.readu8(PluginData,2)/255

temp = Instance.new("Sound")
local Play = GetProperty(temp,"Play")::(Sound)->()
Destroy(temp)
local PlaySound = function(id:string,volume:number):()
	if not VolumeEnabled then return end
	local sound = Instance.new("Sound")
	SetProperty(sound,"SoundId",id)
	SetProperty(sound,"Volume",volume*SoundVolumeMult)
	SetProperty(sound,"Parent",Widget)
	Play(sound)
	task.delay(10,Destroy,sound)
end

local def_tab = {game}::{Instance}
local Path_Parsed = def_tab


local FindService = GetProperty(game,"FindService")::(DataModel,key:string)->Instance
local FindFirstChild = GetProperty(game,"FindFirstChild")::(Instance,name: string, recursive: boolean?)->Instance?

local ParsePath_func = function(Path:string):()
	if Path=="" then
		Path_Parsed=def_tab
		return
	end
	local HierarchyStart = 1
	local t = {}::{Instance}
	local t_index = 1

	while true do
		local SeparatorStart, SeparatorEnd = string.find(Path, "[,;]", HierarchyStart)

		local HierarchyEnd = SeparatorStart and (SeparatorStart - 1) or #Path

		local DotStart = string.find(Path, ".", HierarchyStart, true)
		local LookupEnd = DotStart and (DotStart - 1) or HierarchyEnd

		-- ROOT
		local Root = string.sub(Path, HierarchyStart, LookupEnd)

		local RootService:Instance = if Root=="workspace" then workspace else FindFirstChild(game,Root)::Instance
		if not RootService then
			RootService = FindService(game,Root)
		end

		local i = LookupEnd + 1

		while i <= HierarchyEnd do
			local Char = string.sub(Path, i, i)

			if Char == "." then
				local NextDot = string.find(Path, ".", i + 1, true)
				local NextBracket = string.find(Path, "[", i + 1, true)

				local End = HierarchyEnd + 1

				if NextDot and NextDot < End then
					End = NextDot
				end

				if NextBracket and NextBracket < End then
					End = NextBracket
				end

				local Field = string.sub(Path, i + 1, End - 1)
				RootService = GetProperty(RootService,Field)

				i = End

			elseif Char == "[" then
				local StringStart = i + 2
				local StringEnd = string.find(Path, '"]', StringStart, true)::number

				local Index = string.sub(Path, StringStart, StringEnd - 1)
				RootService = GetProperty(RootService,Index)

				i = StringEnd + 2
			else
				i += 1
			end
		end

		t[t_index]=RootService
		t_index+=1
		if not SeparatorEnd then
			break
		end

		HierarchyStart = SeparatorEnd + 1
	end
	Path_Parsed=t
end
local IsValidPath = pcall(ParsePath_func,Path_String)

local path = Instance.new("TextBox") do
	SetProperty(path,"BackgroundTransparency",1)
	SetProperty(path,"ClearTextOnFocus",false)
	SetProperty(path,"ClipsDescendants",true)
	SetProperty(path,"FontFace",Font_)
	SetProperty(path,"PlaceholderText","game")
	SetProperty(path,"Position",UDim2.fromOffset(200,0))
	SetProperty(path,"Size",UDim2.new(1,-450,0,50))
	SetProperty(path,"Text",Path_String)
	if IsValidPath then
		SetProperty(path,"TextColor3",BrightText)
	else
		SetProperty(path,"TextColor3",Color3_Red)
	end
	SetProperty(path,"PlaceholderColor3",DimmedText)
	SetProperty(path,"TextSize",50)
	SetProperty(path,"Parent",Main)
end
local Export = Instance.new("ImageButton") do
	SetProperty(Export,"BackgroundTransparency",1)
	SetProperty(Export,"Image","rbxassetid://88272104939493")
	SetProperty(Export,"Position",UDim2.new(1,-150,0,0))
	SetProperty(Export,"Size",UDim2_50)
	SetProperty(Export,"Parent",Main)
	ImageButton_Hover(Export,"Export Headers")
end
local Import = Instance.new("ImageButton") do
	SetProperty(Import,"BackgroundTransparency",1)
	SetProperty(Import,"Image","rbxassetid://121989097272758")
	SetProperty(Import,"Position",UDim2.new(1,-200,0,0))
	SetProperty(Import,"Size",UDim2_50)
	SetProperty(Import,"Parent",Main)
	ImageButton_Hover(Import,"Import Headers")
end
local SearchBar_Text = ""
local SearchBar = Instance.new("TextBox") do
	SetProperty(SearchBar,"BackgroundColor3",BorderColor)
	SetProperty(SearchBar,"BorderSizePixel",0)
	SetProperty(SearchBar,"FontFace",Font_)
	SetProperty(SearchBar,"PlaceholderText","Search 🔍")
	SetProperty(SearchBar,"Position",UDim2.fromOffset(0,50))
	SetProperty(SearchBar,"ClearTextOnFocus",false)
	SetProperty(SearchBar,"Size",UDim2.new(1,0,0,35))
	SetProperty(SearchBar,"Text","")
	SetProperty(SearchBar,"TextColor3",BrightText)
	SetProperty(SearchBar,"PlaceholderColor3",DimmedText)
	SetProperty(SearchBar,"TextSize",35)
	SetProperty(SearchBar,"Parent",Main)
end
local SyncCodeButton = Instance.new("ImageButton") do
	SetProperty(SyncCodeButton,"BackgroundTransparency",1)
	SetProperty(SyncCodeButton,"Image","rbxassetid://125804483526342")
	SetProperty(SyncCodeButton,"Position",UDim2.new(1,-250,0,0))
	SetProperty(SyncCodeButton,"Size",UDim2_50)
	SetProperty(SyncCodeButton,"Parent",Main)
	ImageButton_Hover(SyncCodeButton,"Sync Scripts")
end
local Settings = Instance.new("ImageButton") do
	SetProperty(Settings,"BackgroundTransparency",1)
	SetProperty(Settings,"Image","rbxassetid://128557755416943")
	SetProperty(Settings,"Position",UDim2.new(1,-50,0,0))
	SetProperty(Settings,"Size",UDim2_50)
	SetProperty(Settings,"Parent",Main)
	ImageButton_Hover(Settings,"Open Settings")
end
--}

--Scrollbar
local ArrowSize = UDim2.fromOffset(14,14)
local List_Background = Instance.new("ImageButton") do
	SetProperty(List_Background,"AnchorPoint",Vector2.xAxis)
	SetProperty(List_Background,"BackgroundColor3",GetColor(StudioTheme,Enum.StudioStyleGuideColor.ScrollBarBackground))
	SetProperty(List_Background,"AutoButtonColor",false)
	SetProperty(List_Background,"ImageTransparency",1)
	SetProperty(List_Background,"BorderColor3",BorderColor)
	SetProperty(List_Background,"Position",UDim2.new(1,0,0,100))
	SetProperty(List_Background,"Size",UDim2.new(0,14,1,-113))
	SetProperty(List_Background,"Parent",Main)
end



local ScrollBarColor = GetColor(StudioTheme,Enum.StudioStyleGuideColor.ScrollBar)
local ScrollBarColor_Hover = GetColor(StudioTheme,Enum.StudioStyleGuideColor.ScrollBar,Enum.StudioStyleGuideModifier.Hover)

local Handle = Instance.new("ImageButton") do
	SetProperty(Handle,"BackgroundColor3",ScrollBarColor)
	SetProperty(Handle,"AutoButtonColor",false)
	SetProperty(Handle,"ImageTransparency",1)
	SetProperty(Handle,"BorderColor3",BorderColor)
	SetProperty(Handle,"ZIndex",2)
	SetProperty(Handle,"Parent",List_Background)
end
local TopArrow = Instance.new("ImageButton") do
	SetProperty(TopArrow,"AnchorPoint",Vector2.xAxis)
	SetProperty(TopArrow,"BackgroundColor3",ScrollBarColor)
	SetProperty(TopArrow,"BorderColor3",BorderColor)
	SetProperty(TopArrow,"AutoButtonColor",false)
	SetProperty(TopArrow,"Image","rbxassetid://107323324017183")
	SetProperty(TopArrow,"Position",UDim2.new(1,0,0,85))
	SetProperty(TopArrow,"Size",ArrowSize)
	SetProperty(TopArrow,"Parent",Main)
end
local BottomArrow = Instance.new("ImageButton") do
	SetProperty(BottomArrow,"AnchorPoint",Vector2.one)
	SetProperty(BottomArrow,"BackgroundColor3",ScrollBarColor)
	SetProperty(BottomArrow,"BorderColor3",BorderColor)
	SetProperty(BottomArrow,"AutoButtonColor",false)
	SetProperty(BottomArrow,"Image","rbxassetid://76128775374929")
	SetProperty(BottomArrow,"Size",ArrowSize)
	SetProperty(BottomArrow,"Position",UDim2_one)
	SetProperty(BottomArrow,"Parent",Main)
end
local Stack_HeaderCount = 0
local Stack_HeaderCount_By50 = 0




local SelectedHeader:ImageButton?=nil
local SelectedHeader_string:string?=nil
local Header_List_Code = {}::{[string]:string}--{[Name]:Code}
local Headers_Instance = {}::{[string]:ImageButton}
local Live_ViewHeaders = {}::{[string]:LuaSourceContainer}
local Header_Lower = {}::{[string]:string}

local ThemeChangeConnection = Connect(GetProperty(Studio,"ThemeChanged"),function():()
	local StudioTheme = GetProperty(Studio,"Theme")::StudioTheme
	SetProperty(Main,"BackgroundColor3",GetColor(StudioTheme,Enum.StudioStyleGuideColor.MainBackground))
	SetProperty(Hint,"BorderColor3",GetColor(StudioTheme,Enum.StudioStyleGuideColor.ScriptWhitespace))
	local _SelectionColor = GetColor(StudioTheme,Enum.StudioStyleGuideColor.ScriptSelectionBackground)
	SelectionColor=_SelectionColor
	local SelectedHeader = SelectedHeader
	if SelectedHeader then
		SetProperty(SelectedHeader,"BackgroundColor3",_SelectionColor)
	end
	local ScrollBarBackgroundColor = GetColor(StudioTheme,Enum.StudioStyleGuideColor.ScrollBarBackground)
	SetProperty(List_Background,"BackgroundColor3",ScrollBarBackgroundColor)

	local StrokeColor = GetColor(StudioTheme,Enum.StudioStyleGuideColor.Mid)

	local _ScrollBarColor = GetColor(StudioTheme,Enum.StudioStyleGuideColor.ScrollBar)
	ScrollBarColor=_ScrollBarColor
	local _ScrollBarColor_Hover = GetColor(StudioTheme,Enum.StudioStyleGuideColor.ScrollBar,Enum.StudioStyleGuideModifier.Hover)
	ScrollBarColor_Hover=_ScrollBarColor_Hover
	SetProperty(Handle,"BackgroundColor3",_ScrollBarColor)

	SetProperty(TopArrow,"BackgroundColor3",_ScrollBarColor)

	SetProperty(BottomArrow,"BackgroundColor3",_ScrollBarColor)

	local _Tab = GetColor(StudioTheme,Enum.StudioStyleGuideColor.Tab)
	Tab=_Tab
	local _BrightText = GetColor(StudioTheme,Enum.StudioStyleGuideColor.BrightText)
	BrightText=_BrightText
	if IsValidPath then
		SetProperty(path,"TextColor3",_BrightText)
	end
	SetProperty(SearchBar,"TextColor3",_BrightText)
	for i,v in BrightText_Header_Labels do
		SetProperty(v,"TextColor3",_BrightText)
	end

	local _BorderColor = GetColor(StudioTheme,Enum.StudioStyleGuideColor.Border)
	BorderColor=_BorderColor
	SetProperty(BottomArrow,"BorderColor3",_BorderColor)
	SetProperty(TopArrow,"BorderColor3",_BorderColor)
	SetProperty(Handle,"BorderColor3",_BorderColor)
	SetProperty(List_Background,"BorderColor3",_BorderColor)

	SetProperty(ActionBarBG,"BackgroundColor3",_BorderColor)
	SetProperty(SearchBar,"BackgroundColor3",_BorderColor)

	for i,Header in Headers_Instance do
		SetProperty(Header,"BackgroundColor3",_Tab)
		SetProperty(Header,"BorderColor3",_BorderColor)
	end
	local _DimmedText = GetColor(StudioTheme,Enum.StudioStyleGuideColor.DimmedText)
	DimmedText=_DimmedText
	SetProperty(path,"PlaceholderColor3",_DimmedText)
	SetProperty(SearchBar,"PlaceholderColor3",_DimmedText)

end)
local Disconnect = ThemeChangeConnection.Disconnect
local UpdateBarHandle:()->()

--Stack for scrollbar
;(function():()
	local Scrollbar_Size = 0
	local List_Y_Up = GetVector2(GetProperty(List_Background,"AbsolutePosition"),"Y")
	local List_Y_Down = List_Y_Up+GetVector2(GetProperty(List_Background,"AbsoluteSize"),"Y")
	local range = List_Y_Down-List_Y_Up
	local UpdateConstants = function():()
		local _List_Y_Up = GetVector2(GetProperty(List_Background,"AbsolutePosition"),"Y")
		local _List_Y_Down = _List_Y_Up+GetVector2(GetProperty(List_Background,"AbsoluteSize"),"Y")
		List_Y_Up=_List_Y_Up
		List_Y_Down=_List_Y_Down
		range = _List_Y_Down-_List_Y_Up
	end
	Connect(GetPropertyChangedSignal(List_Background,"AbsolutePosition"),UpdateConstants)
	Connect(GetPropertyChangedSignal(List_Background,"AbsoluteSize"),UpdateConstants)

	local Arrow_Step_Up = function(delta:number):()
		local range = range
		local max_px = range*(1-Scrollbar_Size)

		local Follow_px = math.clamp(
			GetVector2(GetProperty(Handle,"AbsolutePosition"),"Y")-List_Y_Up,
			0,
			max_px
		)

		Follow_px = math.clamp(Follow_px - 60*delta,0,max_px)

		local normalized = Follow_px/range

		SetProperty(Headers_List,"CanvasPosition",Vector2.new(0,Stack_HeaderCount_By50*normalized))
		SetProperty(Handle,"Position",UDim2.fromScale(0,normalized))
	end
	local Arrow_Step_Down = function(delta:number):()
		local range = range
		local max_px = range*(1-Scrollbar_Size)

		local Follow_px = math.clamp(
			GetVector2(GetProperty(Handle,"AbsolutePosition"),"Y")-List_Y_Up,
			0,
			max_px
		)

		Follow_px = math.clamp(Follow_px + 60*delta,0,max_px)

		local normalized = Follow_px/range

		SetProperty(Headers_List,"CanvasPosition",Vector2.new(0,Stack_HeaderCount_By50*normalized))
		SetProperty(Handle,"Position",UDim2.fromScale(0,normalized))
	end
	local ArrowUp_task:thread?
	local ArrowUp_Connection:RBXScriptConnection?

	Connect(GetProperty(TopArrow,"MouseButton1Down"),function():()
		Arrow_Step_Up(0.5)
		ArrowUp_task=coroutine.running()
		task.wait(0.5)
		ArrowUp_task=nil
		ArrowUp_Connection=Connect(PreRender,Arrow_Step_Up)
	end)
	Connect(GetProperty(TopArrow,"MouseButton1Up"),function():()
		if ArrowUp_task then task.cancel(ArrowUp_task) end
		if ArrowUp_Connection then Disconnect(ArrowUp_Connection) end
	end)
	Connect(GetProperty(TopArrow,"MouseLeave"),function():()
		if ArrowUp_task then task.cancel(ArrowUp_task) end
		if ArrowUp_Connection then Disconnect(ArrowUp_Connection) end
		SetProperty(TopArrow,"BackgroundColor3",ScrollBarColor)
	end)
	Connect(GetProperty(TopArrow,"MouseEnter"),function():()
		SetProperty(TopArrow,"BackgroundColor3",ScrollBarColor_Hover)
	end)

	local ArrowDown_task:thread?
	local ArrowDown_Connection:RBXScriptConnection?

	Connect(GetProperty(BottomArrow,"MouseButton1Down"),function():()
		Arrow_Step_Down(0.5)
		ArrowDown_task=coroutine.running()
		task.wait(0.5)
		ArrowDown_task=nil
		ArrowDown_Connection=Connect(PreRender,Arrow_Step_Down)
	end)
	Connect(GetProperty(BottomArrow,"MouseButton1Up"),function():()
		if ArrowDown_task then task.cancel(ArrowDown_task) end
		if ArrowDown_Connection then Disconnect(ArrowDown_Connection) end
	end)
	Connect(GetProperty(BottomArrow,"MouseLeave"),function():()
		if ArrowDown_task then task.cancel(ArrowDown_task) end
		if ArrowDown_Connection then Disconnect(ArrowDown_Connection) end
		SetProperty(BottomArrow,"BackgroundColor3",ScrollBarColor)
	end)
	Connect(GetProperty(BottomArrow,"MouseEnter"),function():()
		SetProperty(BottomArrow,"BackgroundColor3",ScrollBarColor_Hover)
	end)

	local Scrolling = function(input:InputObject)
		if InputObject_Get(input,"UserInputType")~=Enum.UserInputType.MouseWheel then return end
		local dir = InputObject_Get(input,"Position").z::number
		local range = range
		local max_px = range*(1-Scrollbar_Size)

		local Follow_px = math.clamp(
			GetVector2(GetProperty(Handle,"AbsolutePosition"),"Y")-List_Y_Up,
			0,
			max_px
		)

		Follow_px = math.clamp(
			Follow_px - dir*50,
			0,
			max_px
		)

		local normalized = Follow_px/range

		SetProperty(Headers_List,"CanvasPosition",Vector2.new(0,Stack_HeaderCount_By50*normalized))
		SetProperty(Handle,"Position",UDim2.fromScale(0,normalized))

	end

	Connect(GetProperty(Headers_List,"InputBegan"),Scrolling)
	Connect(GetProperty(Headers_List,"InputChanged"),Scrolling)

	local _UpdateBarHandle = function():()
		local List_AbsoluteSize_Y = GetVector2(GetProperty(Headers_List,"AbsoluteSize"),"Y")
		local Content_Y = Stack_HeaderCount_By50
		if List_AbsoluteSize_Y>=Content_Y then
			--No scrollbar
			SetProperty(BottomArrow,"Visible",false)
			SetProperty(TopArrow,"Visible",false)
			SetProperty(Handle,"Visible",false)
			SetProperty(List_Background,"Visible",false)
			return
		end
		local size = List_AbsoluteSize_Y/Content_Y
		Scrollbar_Size = size
		SetProperty(Handle,"Size",UDim2.fromScale(1,size))


		local absY = GetVector2(GetProperty(Handle,"AbsolutePosition"),"Y")
		local range = range

		local maxY = List_Y_Up + range*(1-size)

		local low = math.min(List_Y_Up,maxY)
		local high = math.max(List_Y_Up,maxY)

		local scaleY = (math.clamp(absY,low,high)-List_Y_Up)/range

		SetProperty(Handle,"Position",UDim2.fromScale(0,scaleY))


		SetProperty(BottomArrow,"Visible",true)
		SetProperty(TopArrow,"Visible",true)
		SetProperty(Handle,"Visible",true)
		SetProperty(List_Background,"Visible",true)
	end
	Connect(GetPropertyChangedSignal(Headers_List,"AbsoluteSize"),_UpdateBarHandle)
	UpdateBarHandle= _UpdateBarHandle

	local Background_Click_Connection:RBXScriptConnection
	local Target_px = 0
	local Follow_px = 0

	local Background_Click_Step = function(delta:number):()
		local range = range
		local max_px = range*(1-Scrollbar_Size)
		local __Follow_px = Follow_px
		local Target_px = Target_px

		local diff = Target_px-__Follow_px
		local speed = 30 + math.abs(diff)*2 -- px per second
		local step = speed*delta

		local _Follow_px = __Follow_px + math.clamp(diff,-step,step)
		Follow_px = _Follow_px

		local normalized = _Follow_px/range
		local CanvasSize = Stack_HeaderCount_By50
		SetProperty(Headers_List,"CanvasPosition",Vector2.new(0,CanvasSize*normalized))
		SetProperty(Handle,"Position",UDim2.fromScale(0,normalized))

		if diff==0 or math.abs(diff)<=step then
			normalized = Target_px/range
			SetProperty(Handle,"Position",UDim2.fromScale(0,normalized))
			SetProperty(Headers_List,"CanvasPosition",Vector2.new(0,CanvasSize*normalized))
			Disconnect(Background_Click_Connection)
		end
	end

	local InputBeganFunc = function(input:InputObject):()
		if InputObject_Get(input,"UserInputType")~=Enum.UserInputType.MouseButton1 or InputObject_Get(input,"UserInputState")~=Enum.UserInputState.Begin then return end

		local range = range
		local List_Y_Up = List_Y_Up
		local Scrollbar_Size = Scrollbar_Size
		local max_px = range*(1-Scrollbar_Size)
		local y = InputObject_Get(input,"Position").y

		Target_px = math.clamp(
			(y-List_Y_Up)-((range*Scrollbar_Size)*0.5),
			0,
			max_px
		)

		Follow_px = math.clamp(
			GetVector2(GetProperty(Handle,"AbsolutePosition"),"Y")-List_Y_Up,
			0,
			max_px
		)

		Background_Click_Connection = Connect(PreRender,Background_Click_Step)
	end

	Connect(GetProperty(List_Background,"InputEnded"),function(input:InputObject):()
		if InputObject_Get(input,"UserInputType")~=Enum.UserInputType.MouseButton1 or InputObject_Get(input,"UserInputState")~=Enum.UserInputState.End then return end
		Disconnect(Background_Click_Connection)
	end)

	Connect(GetProperty(List_Background,"MouseLeave"),function():()
		if not Background_Click_Connection then return end
		Disconnect(Background_Click_Connection)
	end)
	local Hande_IsHeld = false
	local Handle_Hover = false

	Connect(GetProperty(Handle,"MouseEnter"),function()
		Handle_Hover=true
		SetProperty(Handle,"BackgroundColor3",ScrollBarColor_Hover)
	end)
	Connect(GetProperty(Handle,"MouseLeave"),function()
		Handle_Hover=false
		if Hande_IsHeld then return end
		SetProperty(Handle,"BackgroundColor3",ScrollBarColor)
	end)
	local Handle_MouseGrab = 0
	local Handle_Moving_Connection:RBXScriptConnection




	local Handle_Mouse_Move = function():()
		local y = GetVector2(GetRelativeMousePosition(Widget),"Y")
		local List_Y_Up = List_Y_Up
		local pos = (y-List_Y_Up-Handle_MouseGrab)/range
		local clamped_Pos = math.clamp(pos,0,1-Scrollbar_Size)
		SetProperty(Headers_List,"CanvasPosition",Vector2.new(0,clamped_Pos*Stack_HeaderCount_By50))

		SetProperty(Handle,"Position",UDim2.fromScale(0,clamped_Pos))
	end
	local Hande_InputBegan_Func = function(input:InputObject):()
		if InputObject_Get(input,"UserInputType")~=Enum.UserInputType.MouseButton1 or InputObject_Get(input,"UserInputState")~=Enum.UserInputState.Begin then return end
		Handle_MouseGrab = InputObject_Get(input,"Position").y-GetVector2(GetProperty(Handle,"AbsolutePosition"),"Y")
		Handle_Moving_Connection = Connect(PreRender,Handle_Mouse_Move)
		Hande_IsHeld=true
		SetProperty(Handle,"BackgroundColor3",ScrollBarColor_Hover)
	end
	Connect(GetProperty(Handle,"InputEnded"),function(input:InputObject):()
		if InputObject_Get(input,"UserInputType")~=Enum.UserInputType.MouseButton1 or InputObject_Get(input,"UserInputState")~=Enum.UserInputState.End then return end
		Disconnect(Handle_Moving_Connection)
		Hande_IsHeld=false
		if Handle_Hover then
			SetProperty(Handle,"BackgroundColor3",ScrollBarColor_Hover)
			return
		end
		SetProperty(Handle,"BackgroundColor3",ScrollBarColor)
	end)

	Connect( GetProperty(Handle,"InputBegan"),Hande_InputBegan_Func)
	Connect(GetProperty(List_Background,"InputBegan"),InputBeganFunc)
end)()

local ZIndex_Focus:number = 1

--Create a floating window inside a widget that can be dragged, returns frame and destructor
local CreateWindow = function(Title_Text:string):(Frame,ImageButton)
	local Once = Once
	local Connect = Connect
	local SetProperty = SetProperty
	local GetProperty = GetProperty

	local LastX = 0
	local LastY = 0

	local CurrentX = 0.5
	local CurrentY = 0.5



	local WindowPopUp = Instance.new("ImageButton") do
		SetProperty(WindowPopUp,"AnchorPoint",Vector2_Half)
		SetProperty(WindowPopUp,"AutoButtonColor",false)
		SetProperty(WindowPopUp,"BackgroundColor3",WIndow_Bar_Color)
		SetProperty(WindowPopUp,"BorderSizePixel",0)
		SetProperty(WindowPopUp,"Position",UDim2_Half)
		SetProperty(WindowPopUp,"Size",Window_Bar_Size)
		SetProperty(WindowPopUp,"ZIndex",10)
	end

	local MouseMoved_Func = function(x:number,y:number)

		local AbsSize = GetProperty(Main,"AbsoluteSize")::Vector2
		local AbsX = GetVector2(AbsSize,"X")
		local AbsY = GetVector2(AbsSize,"Y")

		local _CurrentX = CurrentX
		local _CurrentY = CurrentY

		_CurrentX += (x - LastX) / AbsX
		_CurrentY += (y - LastY) / AbsY

		LastX = x
		LastY = y

		_CurrentX = math.clamp(_CurrentX, 0.175, 0.825)
		local Y_px = _CurrentY*AbsY
		Y_px = math.clamp(Y_px,12.5,AbsY-12.5)
		_CurrentY = Y_px/AbsY

		CurrentX = _CurrentX
		CurrentY = _CurrentY

		SetProperty(WindowPopUp,"Position",UDim2.fromScale(CurrentX,CurrentY))
	end

	local connection = Connect(Main_MouseMoved,MouseMoved_Func)
	Disconnect(connection)

	Once(GetProperty(WindowPopUp,"Destroying"),function():()
		Disconnect(connection)
	end)

	Connect(GetProperty(WindowPopUp,"MouseButton1Down"),function(x:number,y:number)
		local _ZIndex_Focus = ZIndex_Focus+1
		ZIndex_Focus=_ZIndex_Focus
		SetProperty(WindowPopUp,"ZIndex",_ZIndex_Focus)
		LastX = x
		LastY = y
		connection = Connect(Main_MouseMoved,MouseMoved_Func)
	end)
	--Connect(GetProperty(WindowPopUp,"MouseButton1Up"),function()
	--	Disconnect(connection)
	--end)
	Connect(GetProperty(WindowPopUp,"InputEnded"),function(input:InputObject):()
		if InputObject_Get(input,"UserInputType")~=Enum.UserInputType.MouseButton1 or InputObject_Get(input,"UserInputState")~=Enum.UserInputState.End then return end
		Disconnect(connection)
	end)

	--[Children] {
	local X = Instance.new("ImageButton") do
		SetProperty(X,"AnchorPoint",Vector2.xAxis)
		SetProperty(X,"BackgroundTransparency",1)
		SetProperty(X,"Image","rbxassetid://104761038953301")
		SetProperty(X,"Position",X_Button_Pos)
		SetProperty(X,"Size",X_Button_Size)
		SetProperty(X,"ZIndex",11)
		ImageButton_Hover(X,"Close Window")
		Connect(GetProperty(X,"MouseButton1Click"),function():()
			Destroy(WindowPopUp)
		end)
		SetProperty(X,"Parent",WindowPopUp)
	end
	local Title = Instance.new("TextLabel") do
		SetProperty(Title,"BackgroundTransparency",1)
		SetProperty(Title,"FontFace",Window_Font)
		SetProperty(Title,"Position",UDim2_fromOffset_10_0)
		SetProperty(Title,"Size",Window_Title_Size)
		SetProperty(Title,"TextColor3",BrightText)
		SetProperty(Title,"Text",Title_Text)
		SetProperty(Title,"TextSize",25)
		SetProperty(Title,"ClipsDescendants",true)
		SetProperty(Title,"TextTruncate",Enum.TextTruncate.SplitWord)
		SetProperty(Title,"TextXAlignment",Enum.TextXAlignment.Left)
		SetProperty(Title,"ZIndex",11)
		SetProperty(Title,"Parent",WindowPopUp)
	end
	--[Children] {
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint") do
		SetProperty(UITextSizeConstraint,"MaxTextSize",20)
		SetProperty(UITextSizeConstraint,"Parent",Title)
	end
	--}
	local Window = Instance.new("Frame") do
		SetProperty(Window,"BackgroundColor3",Color3_White)
		SetProperty(Window,"BorderSizePixel",0)
		SetProperty(Window,"Position",Window_Pos)
		SetProperty(Window,"Size",Window_Size)
		SetProperty(Window,"ZIndex",9)
		SetProperty(Window,"Parent",WindowPopUp)
	end
	do--Visuals only
		--[Children] {
		local UIStroke = Instance.new("UIStroke") do
			SetProperty(UIStroke,"BorderOffset",UDim_new_0_2)
			SetProperty(UIStroke,"Transparency",0.9)
			SetProperty(UIStroke,"ZIndex",9)
			SetProperty(UIStroke,"Parent",Window)
		end
		local UIStroke_1 = Instance.new("UIStroke") do
			SetProperty(UIStroke_1,"BorderOffset",UDim_new_0_1)
			SetProperty(UIStroke_1,"Transparency",0.75)
			SetProperty(UIStroke_1,"ZIndex",9)
			SetProperty(UIStroke_1,"Parent",Window)
		end
		local UIStroke_2 = Instance.new("UIStroke") do
			SetProperty(UIStroke_2,"Transparency",0.5)
			SetProperty(UIStroke_2,"ZIndex",9)
			SetProperty(UIStroke_2,"Parent",Window)
		end
		local UIStroke_3 = Instance.new("UIStroke") do
			SetProperty(UIStroke_3,"BorderOffset",UDim_new_0_3)
			SetProperty(UIStroke_3,"Transparency",0.95)
			SetProperty(UIStroke_3,"ZIndex",9)
			SetProperty(UIStroke_3,"Parent",Window)
		end
		local UIGradient = Instance.new("UIGradient") do
			SetProperty(UIGradient,"Color",Window_Gradient)
			SetProperty(UIGradient,"Rotation",69)
			SetProperty(UIGradient,"Parent",Window)
		end

		local UIGradient_1 = Instance.new("UIGradient") do
			SetProperty(UIGradient_1,"Color",Window_Bar_Gradient)
			SetProperty(UIGradient_1,"Rotation",90)
			SetProperty(UIGradient_1,"Parent",WindowPopUp)
		end
		local UIStroke_4 = Instance.new("UIStroke") do
			SetProperty(UIStroke_4,"BorderOffset",UDim_new_0_2)
			SetProperty(UIStroke_4,"Transparency",0.9)
			SetProperty(UIStroke_4,"ZIndex",9)
			SetProperty(UIStroke_4,"Parent",WindowPopUp)
		end
		local UIStroke_5 = Instance.new("UIStroke") do
			SetProperty(UIStroke_5,"BorderOffset",UDim_new_0_1)
			SetProperty(UIStroke_5,"Transparency",0.75)
			SetProperty(UIStroke_5,"ZIndex",9)
			SetProperty(UIStroke_5,"Parent",WindowPopUp)
		end
		local UIStroke_6 = Instance.new("UIStroke") do
			SetProperty(UIStroke_6,"Transparency",0.5)
			SetProperty(UIStroke_6,"ZIndex",9)
			SetProperty(UIStroke_6,"Parent",WindowPopUp)
		end
		local UIStroke_7 = Instance.new("UIStroke") do
			SetProperty(UIStroke_7,"BorderOffset",UDim_new_0_3)
			SetProperty(UIStroke_7,"Transparency",0.95)
			SetProperty(UIStroke_7,"ZIndex",9)
			SetProperty(UIStroke_7,"Parent",WindowPopUp)
		end
	end
	--}
	task.defer(SetProperty,WindowPopUp,"Parent",Main)

	return Window,WindowPopUp
end

local CreateWarningWindow = function(Window:Frame,Text:string,Icon:string):TextButton
	local Warning_Text = Instance.new("TextLabel") do
		SetProperty(Warning_Text,"AnchorPoint",Vector2_Half_Zero)
		SetProperty(Warning_Text,"BackgroundTransparency",1)
		SetProperty(Warning_Text,"FontFace",Font_)
		SetProperty(Warning_Text,"Position",AreYouSure_Pos)
		SetProperty(Warning_Text,"Size",AreYouSure_Size)
		SetProperty(Warning_Text,"Text",Text)
		SetProperty(Warning_Text,"TextColor3",Color3_Black)
		SetProperty(Warning_Text,"TextScaled",true)
		SetProperty(Warning_Text,"ZIndex",10)
		SetProperty(Warning_Text,"Parent",Window)
	end
	local Warning = Instance.new("ImageLabel") do
		SetProperty(Warning,"AnchorPoint",Vector2_Half)
		SetProperty(Warning,"BackgroundTransparency",1)
		SetProperty(Warning,"Image",Icon)
		SetProperty(Warning,"Position",Warning_Pos)
		SetProperty(Warning,"Size",Warning_Size)
		SetProperty(Warning,"ZIndex",10)
	end
	--[Children] {
	local UISizeConstraint = Instance.new("UISizeConstraint") do
		SetProperty(UISizeConstraint,"MaxSize",Vector2_50)
		SetProperty(UISizeConstraint,"Parent",Warning)
	end
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint",Warning)
	--}
	SetProperty(Warning,"Parent",Window)

	local Ok = Instance.new("TextButton") do
		SetProperty(Ok,"AnchorPoint",Vector2_Half_One)
		SetProperty(Ok,"BackgroundColor3",Color3_White)
		SetProperty(Ok,"BorderSizePixel",0)
		SetProperty(Ok,"FontFace",Font_)
		SetProperty(Ok,"Position",Ok_Pos)
		SetProperty(Ok,"Size",Ok_Size)
		SetProperty(Ok,"Text","Ok")
		SetProperty(Ok,"TextColor3",Color3_Black)
		SetProperty(Ok,"TextSize",50)
		SetProperty(Ok,"ZIndex",10)
	end
	--[Children] {
	local UIGradient = Instance.new("UIGradient") do
		SetProperty(UIGradient,"Color",Window_Gradient)
		SetProperty(UIGradient,"Rotation",-90)
		SetProperty(UIGradient,"Parent",Ok)
	end
	local UIStroke = Instance.new("UIStroke") do
		SetProperty(UIStroke,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(UIStroke,"BorderOffset",UDim_new_0_2)
		SetProperty(UIStroke,"Transparency",0.9)
		SetProperty(UIStroke,"ZIndex",9)
		SetProperty(UIStroke,"Parent",Ok)
	end
	local UIStroke_1 = Instance.new("UIStroke") do
		SetProperty(UIStroke_1,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(UIStroke_1,"BorderOffset",UDim_new_0_1)
		SetProperty(UIStroke_1,"Transparency",0.75)
		SetProperty(UIStroke_1,"ZIndex",9)
		SetProperty(UIStroke_1,"Parent",Ok)
	end
	local UIStroke_2 = Instance.new("UIStroke") do
		SetProperty(UIStroke_2,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(UIStroke_2,"Transparency",0.5)
		SetProperty(UIStroke_2,"ZIndex",9)
		SetProperty(UIStroke_2,"Parent",Ok)
	end
	local UIStroke_3 = Instance.new("UIStroke") do
		SetProperty(UIStroke_3,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(UIStroke_3,"BorderOffset",UDim_new_0_3)
		SetProperty(UIStroke_3,"Transparency",0.95)
		SetProperty(UIStroke_3,"ZIndex",9)
		SetProperty(UIStroke_3,"Parent",Ok)
	end
	SetProperty(Ok,"Parent",Window)
	return Ok
end

--Input has to be lower, Dict: {[lower]:original}, alloc: keys in Dict
local FindBestGuess = function<T>(input:string, Dict:{[string]:T},alloc:number):({T})

	local Values = table.create(alloc)::{string}
	local Scores = table.create(alloc)::{[number]:number}

	local count = 0

	local sub = string.sub
	local find = string.find
	local abs = math.abs
	local min = math.min

	for candidateLower:string, original:string in Dict do
		count += 1
		Values[count] = original

		local lenA = #input
		local lenB = #candidateLower
		local score:number

		if lenA == 0 then
			score = lenB
		elseif lenB == 0 then
			score = lenA
		else
			local d = table.create(lenA + 1)::{[number]:{[number]:number}}

			for i = 1, lenA + 1 do
				local row = table.create(lenB + 1)::{[number]:number}
				row[1] = i - 1
				d[i] = row
			end

			local firstRow = d[1]::{[number]:number}
			for j = 1, lenB + 1 do
				firstRow[j] = j - 1
			end

			for i = 2, lenA + 1 do
				local ai = sub(input, i - 1, i - 1)
				local row = d[i]
				local prevRow = d[i - 1]

				for j = 2, lenB + 1 do
					local cost = if ai == sub(candidateLower, j - 1, j - 1) then 0 else 1

					local deletion = prevRow[j] + 1
					local insertion = row[j - 1] + 1
					local substitution = prevRow[j - 1] + cost

					local best = min(deletion, insertion, substitution)

					if i > 2 and j > 2
						and ai == sub(candidateLower, j - 2, j - 2)
						and sub(input, i - 2, i - 2) == sub(candidateLower, j - 1, j - 1)
					then
						local transpose = d[i - 2][j - 2] + 1
						best = min(best, transpose)
					end

					row[j] = best
				end
			end

			score = d[lenA + 1][lenB + 1]
		end

		if sub(candidateLower, 1, #input) == input or sub(input, 1, #candidateLower) == candidateLower then
			score -= 2
		end

		if find(candidateLower, input, 1, true) or find(input, candidateLower, 1, true) then
			score -= 1
		end

		score += abs(#candidateLower - #input) * 0.25

		Scores[count] = score
	end

	for i = 1, count - 1 do
		local bestIndex = i

		for j = i + 1, count do
			if Scores[j] < Scores[bestIndex] then
				bestIndex = j
			end
		end

		if bestIndex ~= i then
			Scores[i], Scores[bestIndex] = Scores[bestIndex], Scores[i]
			Values[i], Values[bestIndex] = Values[bestIndex], Values[i]
		end
	end

	return Values
end


local UDim2_new1_i14_0_50 = UDim2.new(1,-14,0,50)
local UDim2_new1_i10_1_0 = UDim2.new(1,-10,1,0)


local Stack_Pos_Cache = {}::{UDim2}


local RegisterHeader = function(Name:string,Code:string):()
	local Header = Instance.new("ImageButton") do
		SetProperty(Header,"BackgroundColor3",Tab)
		SetProperty(Header,"BorderColor3",BorderColor)
		SetProperty(Header,"BorderMode",Enum.BorderMode.Middle)
		SetProperty(Header,"Size",UDim2_new1_i14_0_50)
	end
	Connect(GetProperty(Header,"MouseButton1Click"),function():()
		local _SelectedHeader = SelectedHeader
		if _SelectedHeader==Header then return end
		if _SelectedHeader then
			SetProperty(_SelectedHeader,"BackgroundColor3",Tab)
		end
		SetProperty(Header,"BackgroundColor3",SelectionColor)
		SelectedHeader=Header
		SelectedHeader_string=Name
	end)
	--[Children] {
	local HeaderName = Instance.new("TextLabel") do
		SetProperty(HeaderName,"BackgroundTransparency",1)
		SetProperty(HeaderName,"FontFace",Font_)
		SetProperty(HeaderName,"Position",UDim2_fromOffset_10_0)
		SetProperty(HeaderName,"Size",UDim2_new1_i10_1_0)
		SetProperty(HeaderName,"TextColor3",BrightText)
		BrightText_Header_Labels[Name]=HeaderName
		SetProperty(HeaderName,"TextSize",50)
		SetProperty(HeaderName,"Text",Name)
		SetProperty(HeaderName,"TextTruncate",Enum.TextTruncate.SplitWord)
		SetProperty(HeaderName,"TextXAlignment",Enum.TextXAlignment.Left)
		SetProperty(HeaderName,"Parent",Header)
	end
	Header_Lower[string.lower(Name)]=Name
	Headers_Instance[Name]=Header
	Header_List_Code[Name]=Code

	SetProperty(Header,"Parent",Headers_List)
end

while EntryPtr<PluginData_len do
	Stack_HeaderCount+=1
	Stack_Pos_Cache[Stack_HeaderCount] = UDim2.fromOffset(0,(Stack_HeaderCount-1)*50)
	temp = buffer.readu8(PluginData,EntryPtr)
	EntryPtr+=1
	local Name = buffer.readstring(PluginData,EntryPtr,temp)
	EntryPtr+=temp
	temp = buffer.readu32(PluginData,EntryPtr)
	EntryPtr+=4
	local Code = buffer.readstring(PluginData,EntryPtr,temp)
	EntryPtr+=temp
	RegisterHeader(Name,Code)
end
Stack_HeaderCount_By50 = Stack_HeaderCount*50
temp = UDim2.fromOffset(0,Stack_HeaderCount_By50)
Stack_Pos_Cache[Stack_HeaderCount+1]=temp
SetProperty(Headers_List,"CanvasSize",temp)

local Headers_Instance = Headers_Instance
for i,v in FindBestGuess("",Header_Lower,Stack_HeaderCount) do
	SetProperty(Headers_Instance[v],"Position",Stack_Pos_Cache[i])
end

UpdateBarHandle()

--Headers_List

Connect(GetPropertyChangedSignal(SearchBar,"Text"),function():()
	local text = string.lower(GetProperty(SearchBar,"Text")::string)
	SearchBar_Text=text
	local Headers_Instance = Headers_Instance
	local Stack_Pos_Cache = Stack_Pos_Cache
	for i,v in FindBestGuess(text,Header_Lower,Stack_HeaderCount) do
		SetProperty(Headers_Instance[v],"Position",Stack_Pos_Cache[i])
	end
end)
Connect(GetProperty(NewHeader,"MouseButton1Click")::RBXScriptSignal,function():()
	local SetProperty = SetProperty
	local Connect = Connect
	local Window,Bar = CreateWindow("Create Code Save")
	SetProperty(Bar,"ZIndex",ZIndex_Focus+1)

	local Ok = Instance.new("TextButton") do
		SetProperty(Ok,"AnchorPoint",Vector2_Half_One)
		SetProperty(Ok,"BackgroundColor3",Color3_White)
		SetProperty(Ok,"BorderSizePixel",0)
		SetProperty(Ok,"FontFace",Font_)
		SetProperty(Ok,"Position",Ok_Pos)
		SetProperty(Ok,"Size",Ok_Size)
		SetProperty(Ok,"Text","Ok")
		SetProperty(Ok,"TextColor3",Color3_Black)
		SetProperty(Ok,"TextSize",50)
		SetProperty(Ok,"ZIndex",10)
	end
	--[Children] {
	do--Visual instances
		local temp3 = Instance.new("UIGradient") do
			SetProperty(temp3,"Color",Window_Gradient)
			SetProperty(temp3,"Rotation",-90)
			SetProperty(temp3,"Parent",Ok)
		end
		temp3 = Instance.new("UIStroke") do
			SetProperty(temp3,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
			SetProperty(temp3,"BorderOffset",UDim_new_0_2)
			SetProperty(temp3,"Transparency",0.9)
			SetProperty(temp3,"ZIndex",9)
			SetProperty(temp3,"Parent",Ok)
		end
		temp3 = Instance.new("UIStroke") do
			SetProperty(temp3,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
			SetProperty(temp3,"BorderOffset",UDim_new_0_1)
			SetProperty(temp3,"Transparency",0.75)
			SetProperty(temp3,"ZIndex",9)
			SetProperty(temp3,"Parent",Ok)
		end
		temp3 = Instance.new("UIStroke") do
			SetProperty(temp3,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
			SetProperty(temp3,"Transparency",0.5)
			SetProperty(temp3,"ZIndex",9)
			SetProperty(temp3,"Parent",Ok)
		end
		temp3 = Instance.new("UIStroke") do
			SetProperty(temp3,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
			SetProperty(temp3,"BorderOffset",UDim_new_0_3)
			SetProperty(temp3,"Transparency",0.95)
			SetProperty(temp3,"ZIndex",9)
			SetProperty(temp3,"Parent",Ok)
		end
	end
	local InputField = Instance.new("TextBox") do
		SetProperty(InputField,"AnchorPoint",Vector2_Half_Zero)
		SetProperty(InputField,"BackgroundColor3",Color3_White)
		SetProperty(InputField,"BorderSizePixel",0)
		SetProperty(InputField,"FontFace",Font_)
		SetProperty(InputField,"PlaceholderText","Type Name here")
		SetProperty(InputField,"Position",AreYouSure_Pos)
		SetProperty(InputField,"Size",UDim2_07__0544)
		SetProperty(InputField,"Text","")
		SetProperty(InputField,"TextColor3",Color3_Black)
		SetProperty(InputField,"TextSize",40)
		SetProperty(InputField,"ClipsDescendants",true)
		SetProperty(InputField,"ClearTextOnFocus",false)
		SetProperty(InputField,"ZIndex",10)
	end
	do--Visual instances
		local temp3 = Instance.new("UIGradient") do
			SetProperty(temp3,"Color",Window_Gradient)
			SetProperty(temp3,"Rotation",-90)
			SetProperty(temp3,"Parent",InputField)
		end
		temp3 = Instance.new("UIStroke") do
			SetProperty(temp3,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
			SetProperty(temp3,"BorderOffset",UDim_new_0_2)
			SetProperty(temp3,"Transparency",0.9)
			SetProperty(temp3,"ZIndex",9)
			SetProperty(temp3,"Parent",InputField)
		end
		temp3 = Instance.new("UIStroke") do
			SetProperty(temp3,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
			SetProperty(temp3,"BorderOffset",UDim_new_0_1)
			SetProperty(temp3,"Transparency",0.75)
			SetProperty(temp3,"ZIndex",9)
			SetProperty(temp3,"Parent",InputField)
		end
		temp3 = Instance.new("UIStroke") do
			SetProperty(temp3,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
			SetProperty(temp3,"Transparency",0.5)
			SetProperty(temp3,"ZIndex",9)
			SetProperty(temp3,"Parent",InputField)
		end
		temp3 = Instance.new("UIStroke") do
			SetProperty(temp3,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
			SetProperty(temp3,"BorderOffset",UDim_new_0_3)
			SetProperty(temp3,"Transparency",0.95)
			SetProperty(temp3,"ZIndex",9)
			SetProperty(temp3,"Parent",InputField)
		end
	end

	Connect(GetProperty(Ok,"MouseButton1Click"),function():()
		local SetProperty = SetProperty
		local text = string.sub(GetProperty(InputField,"Text")::string,1,255)
		if Header_List_Code[text] or Header_Lower[string.lower(text)] then
			warn("[Include]: This name already exists!")
			local _Window,_Bar = CreateWindow("Duplicate Name Error")
			SetProperty(_Bar,"ZIndex",ZIndex_Focus+1)
			local _Ok = CreateWarningWindow(_Window,"The current key: \""..text.."\" already exists!","rbxassetid://101266206703626")
			Once(GetProperty(_Ok,"MouseButton1Click"),function():()
				Destroy(_Bar)
			end)
			PlaySound("rbxassetid://134189051248016",2)
			task.delay(5,Destroy,_Bar)
			return
		end
		local _Stack_HeaderCount = Stack_HeaderCount+1
		Stack_HeaderCount = _Stack_HeaderCount
		local _Stack_HeaderCount_By50 = _Stack_HeaderCount*50
		Stack_HeaderCount_By50 = _Stack_HeaderCount_By50
		local next = _Stack_HeaderCount+1
		local Canvas = Stack_Pos_Cache[next]
		if not Canvas then
			Canvas = UDim2.fromOffset(0,_Stack_HeaderCount_By50)
			Stack_Pos_Cache[next] = Canvas
		end
		SetProperty(Headers_List,"CanvasSize",Canvas)
		RegisterHeader(text,"")
		local Headers_Instance = Headers_Instance
		for i,v in FindBestGuess(SearchBar_Text,Header_Lower,_Stack_HeaderCount) do
			SetProperty(Headers_Instance[v],"Position",Stack_Pos_Cache[i])
		end
		Destroy(Bar)
	end)

	SetProperty(Ok,"Parent",Window)
	SetProperty(InputField,"Parent",Window)
end)

Connect(GetProperty(ViewHeader,"MouseButton1Click")::RBXScriptSignal,function():()
	local Name = SelectedHeader_string
	if not Name then
		local Window,Bar = CreateWindow("View")
		SetProperty(Bar,"ZIndex",ZIndex_Focus+1)
		local Ok = CreateWarningWindow(Window,"No target is selected!","rbxassetid://101266206703626")
		--}
		Once(GetProperty(Ok,"MouseButton1Click"),function():()
			PlaySound("rbxassetid://135757009748193",1)
			Destroy(Bar)
		end)
		PlaySound("rbxassetid://134189051248016",2)
		task.delay(5,Destroy,Bar)
		return
	end
	local script = Live_ViewHeaders[Name]
	if not script then
		script = Instance.new("Script")
		SetProperty(script,"Archivable",false)
		SetProperty(script,"RunContext",Enum.RunContext.Plugin)
		SetProperty(script,"Enabled",false)
		SetProperty(script,"Name",Name)
		SetProperty(script,"Parent",game)
		Once(GetPropertyChangedSignal(script,"Parent"),function():()
			Live_ViewHeaders[Name]=nil
		end)
		Live_ViewHeaders[Name]=script
	end
	UpdateSourceAsync(ScriptEditorService,script,function():string
		return Header_List_Code[Name]
	end)
	OpenScriptDocumentAsync(ScriptEditorService,script)
end)
Connect(GetProperty(DeleteHeader,"MouseButton1Click")::RBXScriptSignal,function():()
	local Name = SelectedHeader_string
	if not Name then
		local Window,Bar = CreateWindow("Deletion Request")
		SetProperty(Bar,"ZIndex",ZIndex_Focus+1)
		local Ok = CreateWarningWindow(Window,"No target is selected!","rbxassetid://101266206703626")
		--}
		Once(GetProperty(Ok,"MouseButton1Click"),function():()
			PlaySound("rbxassetid://135757009748193",1)
			Destroy(Bar)
		end)
		PlaySound("rbxassetid://134189051248016",2)
		task.delay(5,Destroy,Bar)
		return
	end


	local Window,Bar = CreateWindow("Deletion Request")
	SetProperty(Bar,"ZIndex",ZIndex_Focus+1)

	local Ok = CreateWarningWindow(Window,"Are you sure want to permanently delete \""..Name.."\"?","rbxassetid://101266206703626")

	--}
	Once(GetProperty(Ok,"MouseButton1Click"),function():()
		if Name~=SelectedHeader_string then Destroy(Bar) return end
		PlaySound("rbxassetid://135757009748193",1)
		local _SelectedHeader = SelectedHeader
		if not _SelectedHeader then return end
		Destroy(Bar)
		local _Stack_HeaderCount = Stack_HeaderCount
		local sizeStack = _Stack_HeaderCount-1
		Stack_HeaderCount=sizeStack
		Stack_HeaderCount_By50 = sizeStack*50
		SetProperty(Headers_List,"CanvasSize",Stack_Pos_Cache[_Stack_HeaderCount] or UDim2_one)
		Destroy(_SelectedHeader::ImageButton)
		SelectedHeader=nil
		SelectedHeader_string=nil
		local Name = Name
		Header_Lower[string.lower(Name)]=nil
		Header_List_Code[Name]=nil
		Headers_Instance[Name]=nil
		local Label = BrightText_Header_Labels[Name]
		Destroy(Label)
		BrightText_Header_Labels[Name]=nil

		local script = Live_ViewHeaders[Name]::LuaSourceContainer?
		if script then
			Destroy(script)
		end
		for i,v in FindBestGuess(SearchBar_Text,Header_Lower,Stack_HeaderCount) do
			SetProperty(Headers_Instance[v],"Position",Stack_Pos_Cache[i])
		end
	end)
end)

Connect(GetProperty(SaveHeader,"MouseButton1Click")::RBXScriptSignal,function():()
	local Name = SelectedHeader_string
	if not Name then
		local Window,Bar = CreateWindow("Save Attempt")
		SetProperty(Bar,"ZIndex",ZIndex_Focus+1)
		local Ok = CreateWarningWindow(Window,"No target is selected!","rbxassetid://101266206703626")
		--}
		Once(GetProperty(Ok,"MouseButton1Click"),function():()
			PlaySound("rbxassetid://135757009748193",1)
			Destroy(Bar)
		end)
		PlaySound("rbxassetid://134189051248016",2)
		task.delay(5,Destroy,Bar)
		return
	end
	local script_open = GetProperty(StudioService,"ActiveScript")::LuaSourceContainer?
	if script_open then
		local document = FindScriptDocument(ScriptEditorService,script_open::LuaSourceContainer)
		if document then
			local text = GetSelectedText(document)::string
			Header_List_Code[Name]=text
			return
		end
	end
	for i,v in Get_Selection(Selection) do
		if not IsA(v,"LuaSourceContainer") then continue end
		Header_List_Code[Name]=GetEditorSource(ScriptEditorService,v::LuaSourceContainer)
		return
	end
	warn("[Include]: Please select code snippet first.")
end)


local UDim2_fromScale0__25_0__5 = UDim2.fromScale(0.25,0.5)
local UDim2_fromScale0__75_0__5 = UDim2.fromScale(0.75,0.5)
local UDim2_fromScale0__1_0__344 = UDim2.fromScale(0.1,0.344)
local UDim2_fromScale0__25_0__966 = UDim2.fromScale(0.25,0.966)
local UDim2_fromScale0__1_0__966 = UDim2.fromScale(0.1,0.966)
local UDim2_new1_i10_0__966_0 = UDim2.new(1,-10,0.966,0)
local UDim2_new_1_i66_0__966_0 = UDim2.new(1,-66,0.966,0)
local UDim2_fromScale_0_19__0_344 = UDim2.fromScale(0.19,0.344)

local ExportScript:LuaSourceContainer?=nil
Connect(GetProperty(Export,"MouseButton1Click")::RBXScriptSignal,function():()
	PlaySound("rbxassetid://103866342467024",2)

	local Font_ = Font_
	local IsBinaryFormat = true
	local PromptSave = false
	local CompressionLvl = 22

	local Window,Bar = CreateWindow("Include: Export Data")
	local Ok = Instance.new("TextButton") do
		SetProperty(Ok,"AnchorPoint",Vector2_Half_One)
		SetProperty(Ok,"BackgroundColor3",Color3_White)
		SetProperty(Ok,"BorderSizePixel",0)
		SetProperty(Ok,"FontFace",Font_)
		SetProperty(Ok,"Position",Ok_Pos)
		SetProperty(Ok,"Size",Ok_Size)
		SetProperty(Ok,"Text","Ok")
		SetProperty(Ok,"TextColor3",Color3_Black)
		SetProperty(Ok,"TextSize",50)
		SetProperty(Ok,"ZIndex",10)
		SetProperty(Ok,"Parent",Window)
	end
	--[Children] {
	local temp = Instance.new("UIGradient") do
		SetProperty(temp,"Color",Window_Gradient)
		SetProperty(temp,"Rotation",-90)
		SetProperty(temp,"Parent",Ok)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_2)
		SetProperty(temp,"Transparency",0.9)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Ok)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_1)
		SetProperty(temp,"Transparency",0.75)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Ok)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"Transparency",0.5)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Ok)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_3)
		SetProperty(temp,"Transparency",0.95)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Ok)
	end
	local UDim2_fromScale_0_19__0_344 = UDim2_fromScale_0_19__0_344
	--Save_Label
	temp = Instance.new("TextLabel") do
		SetProperty(temp,"AnchorPoint",Vector2.one)
		SetProperty(temp,"BackgroundTransparency",1)
		SetProperty(temp,"FontFace",Font_)
		--SetProperty(temp,"Name","Save_Label")
		SetProperty(temp,"Position",UDim2_new_1_i66_0__966_0)
		SetProperty(temp,"Size",UDim2_fromScale_0_19__0_344)
		SetProperty(temp,"Text","Save")
		SetProperty(temp,"TextColor3",Color3_Black)
		SetProperty(temp,"TextSize",40)
		SetProperty(temp,"TextTruncate",Enum.TextTruncate.SplitWord)
		SetProperty(temp,"ZIndex",10)
		SetProperty(temp,"Parent",Window)
	end

	local Save_Button = Instance.new("ImageButton") do
		SetProperty(Save_Button,"AnchorPoint",Vector2.one)
		SetProperty(Save_Button,"AutoButtonColor",false)
		SetProperty(Save_Button,"BackgroundTransparency",1)
		SetProperty(Save_Button,"Image","rbxassetid://78966475852487")
		--SetProperty(Save_Button,"Name","Save_Button")
		SetProperty(Save_Button,"Position",UDim2_new1_i10_0__966_0)
		SetProperty(Save_Button,"Size",UDim2_50)
		SetProperty(Save_Button,"Parent",Window)
	end

	Connect(GetProperty(Save_Button,"MouseButton1Click"),function():()
		local _PromptSave = not PromptSave
		PromptSave=_PromptSave
		if _PromptSave then
			SetProperty(Save_Button,"Image","rbxassetid://131950065573162")
			return
		end
		SetProperty(Save_Button,"Image","rbxassetid://78966475852487")
	end)

	--Compression_Label
	temp = Instance.new("TextLabel") do
		SetProperty(temp,"AnchorPoint",Vector2_Half_One)
		SetProperty(temp,"BackgroundTransparency",1)
		SetProperty(temp,"FontFace",Font_)
		--SetProperty(Compression_Label,"Name","Compression_Label")
		SetProperty(temp,"Position",UDim2_fromScale0__1_0__966)
		SetProperty(temp,"Size",UDim2_fromScale_0_19__0_344)
		SetProperty(temp,"Text","Compression")
		SetProperty(temp,"TextColor3",Color3_Black)
		SetProperty(temp,"TextSize",16)
		SetProperty(temp,"TextTruncate",Enum.TextTruncate.SplitWord)
		SetProperty(temp,"ZIndex",10)
		SetProperty(temp,"Parent",Window)
	end
	local Compression = Instance.new("TextBox") do
		SetProperty(Compression,"AnchorPoint",Vector2_Half_One)
		SetProperty(Compression,"BackgroundColor3",Color3_White)
		SetProperty(Compression,"BorderSizePixel",0)
		SetProperty(Compression,"ClearTextOnFocus",false)
		SetProperty(Compression,"FontFace",Font_)
		--SetProperty(Compression,"Name","Compression")
		SetProperty(Compression,"Position",UDim2_fromScale0__25_0__966)
		SetProperty(Compression,"Size",UDim2_fromScale0__1_0__344)
		SetProperty(Compression,"Text","22")
		SetProperty(Compression,"TextColor3",Color3_Black)
		SetProperty(Compression,"TextSize",50)
		SetProperty(Compression,"ZIndex",10)
		SetProperty(Compression,"Parent",Window)
	end
	Connect(GetProperty(Compression,"FocusLost"),function():()
		local num = math.clamp((tonumber(GetProperty(Compression,"Text")) or 22)//1,-7,22)
		CompressionLvl=num
		SetProperty(Compression,"Text",tostring(num))
	end)
	--[Children] {
	temp = Instance.new("UIGradient") do
		SetProperty(temp,"Color",Window_Gradient)
		SetProperty(temp,"Rotation",-90)
		SetProperty(temp,"Parent",Compression)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_2)
		SetProperty(temp,"Transparency",0.9)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Compression)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_1)
		SetProperty(temp,"Transparency",0.75)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Compression)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"Transparency",0.5)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Compression)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_3)
		SetProperty(temp,"Transparency",0.95)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Compression)
	end
	--}

	local Binary = Instance.new("TextButton") do
		SetProperty(Binary,"AnchorPoint",Vector2_Half_One)
		SetProperty(Binary,"BackgroundColor3",Color3_White)
		SetProperty(Binary,"BorderSizePixel",0)
		SetProperty(Binary,"FontFace",Font_)
		--SetProperty(Binary,"Name","Binary")
		SetProperty(Binary,"Position",UDim2_fromScale0__25_0__5)
		SetProperty(Binary,"Size",Ok_Size)
		SetProperty(Binary,"Text","Binary")
		SetProperty(Binary,"TextColor3",Color3_Black)
		SetProperty(Binary,"TextSize",50)
		SetProperty(Binary,"TextTruncate",Enum.TextTruncate.SplitWord)
		SetProperty(Binary,"ZIndex",10)
		SetProperty(Binary,"Parent",Window)
	end
	--[Children] {
	temp = Instance.new("UIGradient") do
		SetProperty(temp,"Color",Window_Gradient)
		SetProperty(temp,"Rotation",-90)
		SetProperty(temp,"Parent",Binary)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_2)
		SetProperty(temp,"Transparency",0.9)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Binary)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_1)
		SetProperty(temp,"Transparency",0.75)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Binary)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"Transparency",0.5)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Binary)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_3)
		SetProperty(temp,"Transparency",0.95)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Binary)
	end
	local SelectionStroke = Instance.new("UIStroke") do
		SetProperty(SelectionStroke,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(SelectionStroke,"Color",SelectionColor)
		--SetProperty(SelectionStroke,"Name","SelectionStroke")
		SetProperty(SelectionStroke,"Thickness",2)
		SetProperty(SelectionStroke,"ZIndex",10)
		SetProperty(SelectionStroke,"Parent",Binary)
	end
	--}
	Connect(GetProperty(Binary,"MouseButton1Click"),function():()
		IsBinaryFormat=true
		SetProperty(SelectionStroke,"Parent",Binary)
	end)

	local JSON = Instance.new("TextButton") do
		SetProperty(JSON,"AnchorPoint",Vector2_Half_One)
		SetProperty(JSON,"BackgroundColor3",Color3_White)
		SetProperty(JSON,"BorderSizePixel",0)
		SetProperty(JSON,"FontFace",Font_)
		--SetProperty(JSON,"Name","JSON")
		SetProperty(JSON,"Position",UDim2_fromScale0__75_0__5)
		SetProperty(JSON,"Size",Ok_Size)
		SetProperty(JSON,"Text","JSON")
		SetProperty(JSON,"TextColor3",Color3_Black)
		SetProperty(JSON,"TextSize",50)
		SetProperty(JSON,"TextTruncate",Enum.TextTruncate.SplitWord)
		SetProperty(JSON,"ZIndex",10)
		SetProperty(JSON,"Parent",Window)
	end
	Connect(GetProperty(JSON,"MouseButton1Click"),function():()
		IsBinaryFormat=false
		SetProperty(SelectionStroke,"Parent",JSON)
	end)
	--[Children] {
	temp = Instance.new("UIGradient") do
		SetProperty(temp,"Color",Window_Gradient)
		SetProperty(temp,"Rotation",-90)
		SetProperty(temp,"Parent",JSON)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_2)
		SetProperty(temp,"Transparency",0.9)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",JSON)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_1)
		SetProperty(temp,"Transparency",0.75)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",JSON)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"Transparency",0.5)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",JSON)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_3)
		SetProperty(temp,"Transparency",0.95)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",JSON)
	end
	--}
	Connect(GetProperty(Ok,"MouseButton1Click"),function():()
		Destroy(Bar)
		PlaySound("rbxassetid://105989164103918",2)
		local script = ExportScript::LuaSourceContainer
		if not script then
			script = Instance.new("Script")
			SetProperty(script,"Name","Include: Export Data")
			SetProperty(script,"Archivable",false)
			SetProperty(script,"RunContext",Enum.RunContext.Plugin)
			SetProperty(script ,"Enabled",false)
			SetProperty(script,"Parent",game)
			Once(GetPropertyChangedSignal(script,"Parent"),function():()
				ExportScript=nil
			end)
			ExportScript=script
		end
		if IsBinaryFormat then
			local Path_String = Path_String
			local Path_String_len = #Path_String
			local len = 8+Path_String_len
			local buff = buffer.create(len)
			buffer.writeu32(buff,0,0x44485359)--YSHD 0x44485359
			buffer.writeu8(buff,4,SaveDelay)
			local b = if AutoSave then 1 else 0
			if ScriptAnalisis_bool then
				b = bit32.bor(b,0b10)
			end
			if VolumeEnabled then
				b = bit32.bor(b,0b100)
			end
			buffer.writeu8(buff,5,b)
			buffer.writeu8(buff,6,SoundVolumeMult*255)
			buffer.writeu8(buff,7,Path_String_len)
			buffer.writestring(buff,8,Path_String)
			local EntryPtr = len
			for i,v in Header_List_Code do
				local i_len = #i
				local v_len = #v
				local Cost = 5+i_len+v_len+EntryPtr
				if len<Cost then
					local new_buff_len = math.max(len+len,Cost)
					local new_buff = buffer.create(new_buff_len)
					buffer.copy(new_buff,0,buff,0,EntryPtr)
					buff=new_buff
					len=new_buff_len
				end
				buffer.writeu8(buff,EntryPtr,i_len)
				EntryPtr+=1
				buffer.writestring(buff,EntryPtr,i)
				EntryPtr+=i_len
				buffer.writeu32(buff,EntryPtr,v_len)
				EntryPtr+=4
				buffer.writestring(buff,EntryPtr,v)
				EntryPtr+=v_len
			end
			if len>EntryPtr then
				local shrink = buffer.create(EntryPtr)
				buffer.copy(shrink,0,buff,0,EntryPtr)
				buff = shrink
			end

			buff = Base64Encode(EncodingService,CompressBuffer(EncodingService,buff,Enum.CompressionAlgorithm.Zstd,CompressionLvl))
			local str = buffer.readstring(buff,0,buffer.len(buff))
			UpdateSourceAsync(ScriptEditorService,script,function():string
				return str
			end)
			OpenScriptDocumentAsync(ScriptEditorService,script)
			if PromptSave then
				Set_Selection(Selection,{script})
				PromptSaveSelectionAsync(plugin,"Export_yshd")
			end
			return
		end

		--JSON

		local Headers = table.create(Stack_HeaderCount)::{
			[number]:{
				Title:string;
				Code:string
			}
		}
		local i=0
		for Name,Code in Header_List_Code do
			i+=1
			Headers[i] = {Title=Name;Code=Code}
		end
		local json = JSONEncode(HttpService,{
			Path = Path_String;
			Analysis = ScriptAnalisis_bool;
			AutoSave = AutoSave;
			VolumeEnabled = VolumeEnabled;
			SoundVolumeMult = SoundVolumeMult;
			SaveDelay = SaveDelay;
			Headers = Headers;
		}::JSON_Export)
		UpdateSourceAsync(ScriptEditorService,script,function():string
			return json
		end)
		OpenScriptDocumentAsync(ScriptEditorService,script)
		if PromptSave then
			Set_Selection(Selection,{script})
			PromptSaveSelectionAsync(plugin,"Export_yshd")
		end
	end)
end)

local PleasePasteSave = function(content:string):string
	return "--Please Ctrl+V save\n"
end
local UDim2_fromScale0__75_0__966 = UDim2.fromScale(0.75,0.966)

local ForceSetSelectionAsync:(documet:ScriptDocument,cursorLine:number, cursorCharacter:number, anchorLine:number?, anchorCharacter:number?)->()
ForceSetSelectionAsync = function(documet:ScriptDocument,cursorLine:number, cursorCharacter:number, anchorLine:number?, anchorCharacter:number?):()
	local func = GetProperty(documet,"ForceSetSelectionAsync")::(documet:ScriptDocument,cursorLine:number, cursorCharacter:number, anchorLine:number?, anchorCharacter:number?)->()
	ForceSetSelectionAsync = func
	func(documet,cursorLine,cursorCharacter,anchorLine,anchorCharacter)
end
local FindScriptDocument = GetProperty(ScriptEditorService,"FindScriptDocument")::(ScriptEditorService,script:LuaSourceContainer)->ScriptDocument
local AllowedExtensions = {"lua";"luau";"txt";"json";"yshd"};
local GetBinaryContents:(File)->string
GetBinaryContents = function(file:File):string
	local func = GetProperty(file,"GetBinaryContents")::(File)->string
	GetBinaryContents = func
	return func(file)
end;

local Local_Headers = {}::{
	[LuaSourceContainer]:{
		[string]:string--Header: Code
	}
}

local UpdateInclude:(source:string, visited:{[string]:true})->string
UpdateInclude = function(source:string, visited:{[string]:true}):string
	local output = ""
	local pos = 1
	local len = #source

	while pos <= len do
		--skip long strings [[ ... ]]
		local s, e, key = string.find(source, "%-%-#include%s*<([%w_%.]-)>", pos)
		do
			local ls, le = string.find(source, "%[[%[=]*", pos)

			if ls and (not s or ls < s) then
				local long_end = string.find(source, "%][%]=]*", le)
				if not long_end then
					output ..= string.sub(source, pos)
					break
				end

				output ..= string.sub(source, pos, long_end + 1)
				pos = long_end + 2
				continue
			end
		end

		--skip normal strings (' " `)
		do
			local rs = string.find(source, "['\"`]", pos)


			if rs and (not s or rs < s) then
				local quote = string.sub(source, rs, rs)
				local i = rs + 1
				while i <= len do
					local ch = string.sub(source, i, i)
					if ch == "\\" then
						i = i + 2
					elseif ch == quote then
						break
					else
						i += 1
					end
				end

				output ..= string.sub(source, pos, i)
				pos = i + 1
				continue
			end
		end

		--Handle include if found

		if not s then
			output ..= string.sub(source, pos)
			break
		end

		-- dump normal text
		output ..= string.sub(source, pos, e)
		pos = e::number + 1

		-- find file
		local code_field = Header_List_Code[key::string]

		if code_field then
			if not visited[key::string] then
				visited[key::string] = true
				local expanded = UpdateInclude(code_field, visited)
				visited[key::string] = nil
				output ..= "\n" .. expanded .. "\n"
			end
		end

		-- find matching close
		local start_close, end_close = string.find(source, "%-%-\\include", pos)
		if not start_close then
			-- malformed include block -> just bail cleanly
			break
		end

		output ..= string.sub(source, start_close, end_close)
		pos = end_close::number + 1
	end

	return output
end

local UpdateScriptHeaders = function(src:string):string
	return UpdateInclude(src,{})
end

local UpdateAsyncCode = function(doc:ScriptDocument,Script:LuaSourceContainer,CursorLine:number,CursorChar,AnchorLine,AnchorChar):()
	UpdateSourceAsync(ScriptEditorService,Script,UpdateScriptHeaders)
	ForceSetSelectionAsync(doc,CursorLine,CursorChar,AnchorLine,AnchorChar)
end

local FuncSyncScriptHeaders = function():()
	--local RecordingKey = TryBeginRecording(ChangeHistoryService,"Include_YS_Sync_Write","Sync Headers")
	--if not RecordingKey then
	--	warn("[Include]: Unable to start the recording")
	--	return
	--end
	for _,parent in Path_Parsed do
		for ii,vv in GetDescendants(parent)::{Instance} do
			if not IsA(vv,"LuaSourceContainer") then continue end
			local doc = FindScriptDocument(ScriptEditorService,vv::LuaSourceContainer)
			if doc then
				local CursorLine, CursorChar, AnchorLine, AnchorChar = GetSelection(doc)
				task.spawn(UpdateAsyncCode,doc,vv::LuaSourceContainer,CursorLine,CursorChar,AnchorLine,AnchorChar)
				continue
			end
			task.spawn(UpdateSourceAsync,ScriptEditorService,vv::LuaSourceContainer,UpdateScriptHeaders)
		end
	end
	--FinishRecording(ChangeHistoryService,RecordingKey,Enum.FinishRecordingOperation.Commit)
end

Connect(GetProperty(SyncCodeButton,"MouseButton1Click")::RBXScriptSignal,function():()
	FuncSyncScriptHeaders()
	local Window,Bar = CreateWindow("Sync Headers")
	SetProperty(Bar,"ZIndex",ZIndex_Focus+1)
	local Ok = CreateWarningWindow(Window,"Success!","rbxassetid://116737068396089")
	Once(GetProperty(Ok,"MouseButton1Click"),function():()
		PlaySound("rbxassetid://135757009748193",1)
		Destroy(Bar)
	end)
	PlaySound("rbxassetid://118264684563077",1)
	task.delay(5,Destroy,Bar)
end)

Connect(GetProperty(Action_SyncHeaders,"Triggered")::RBXScriptSignal,FuncSyncScriptHeaders)
Connect(GetProperty(Action_UpdateHeader,"Triggered")::RBXScriptSignal,function():()
	local script_open = GetProperty(StudioService,"ActiveScript")::LuaSourceContainer?
	if not script_open then warn("[Include]: no scripts open") return end
	local document = FindScriptDocument(ScriptEditorService,script_open)
	if not document then warn("[Include]: can't obtain script document") return end
	local code = GetSelectedText(document)
	local line1,_,line2 = GetSelection(document)
	local line = math.min(line1,line2)
	local current_key:string? = nil
	for i=1,line-1 do
		local s,e,key = string.find(GetLine(document,i), "%-%-#include%s*<([%w_%.]-)>")
		current_key = key::string?
	end
	if current_key then
		local key = SelectedHeader_string
		if not key then
			local Window,Bar = CreateWindow("Deletion Request")
			SetProperty(Bar,"ZIndex",ZIndex_Focus+1)
			local Ok = CreateWarningWindow(Window,"No target is selected!","rbxassetid://101266206703626")
			--}
			Once(GetProperty(Ok,"MouseButton1Click"),function():()
				PlaySound("rbxassetid://135757009748193",1)
				Destroy(Bar)
			end)
			PlaySound("rbxassetid://134189051248016",2)
			task.delay(5,Destroy,Bar)
			return
		end
		Header_List_Code[key]=code
	end
end)



Connect(GetProperty(path,"Focused"),function():()
	SetProperty(path,"TextColor3",BrightText)
end)
Connect(GetProperty(path,"FocusLost")::RBXScriptSignal,function():()
	local text = GetProperty(path,"Text")
	local try = pcall(ParsePath_func,text)::boolean
	IsValidPath = try
	if not try then
		SetProperty(path,"TextColor3",Color3_Red)
		Path_Parsed = def_tab
		return
	end
end)

type Request = {
	position: {
		line: number,
		character: number
	},
	textDocument: {
		document: ScriptDocument?,
		script: LuaSourceContainer?
	}
}
type Response = {
	items:{item}
}
type item = {
	label: string, -- The label
	kind: Enum.CompletionItemKind?,
	tags: {Enum.CompletionItemTag}?,
	detail: string?,
	documentation: {
		value: string,
	}?,
	overloads: number?,
	learnMoreLink: string?,
	codeSample: string?,
	preselect: boolean?,
	textEdit:textEdit
}
type line_sequence = {line: number,character: number}
type start_end = {start:line_sequence;["end"]:line_sequence}
type textEdit = {
	newText: string,
	insert: start_end,
	replace: start_end,
}?
local include_item:item = {label="include";
	kind=Enum.CompletionItemKind.Keyword;
	detail = "Include Keyword";
	documentation = {value="Sync up code field"};
	codeSample = [[--#include <MyHeader>
	local function MyPrint(val:string):()
		print(val)
	end
	--\include]]
}


local IsInsideString = function(source:string,line_n:number,char_position:number,line:string):boolean
	local parse_line = 1
	local ptr = 1

	local NewLineBreak = "\n"
	local MatchCase = "%[=*%["
	local char1 = "]"
	local char2 = "="

	local char3 = "\""
	local char4 = "'"
	local char5 = "`"
	local UniversalPattern = "[\"'`%[]"
	local StringOnlyPattern = "[\"'`]"

	local captured = false
	local findMatch:string
	local string_capture_upper = false--""
	local string_capture_lower = false--''
	local string_capture_interpl = false--``
	do
		while parse_line < line_n do
			local newline = string.find(source,NewLineBreak,ptr,true)
			if not newline then break end
			--	[[Closers]]
			if string_capture_interpl then--` interpolation close
				local close_i,close_e = string.find(source,char5,ptr)
				if close_i and close_i < newline then

					local i = close_i-1
					if string.byte(source,i)==92 then
						local n = 0
						while string.byte(source,i)==92 do
							i-=1
							n+=1
						end
						if not bit32.btest(n,0b1) then
							string_capture_interpl=false

							ptr=(close_e::number)+1
							continue
						end

						ptr=(close_e::number)+1
						continue
					end

					string_capture_interpl=false
					ptr=(close_e::number)+1
					continue
				end
				ptr=newline+1
				parse_line+=1
				continue
			elseif captured then--] ]
				local close_i,close_e = string.find(source,findMatch,ptr,true)

				if close_i and close_i < newline then
					captured=false
					ptr=(close_e::number)+1
					continue
				end

				ptr=newline+1
				parse_line+=1
				continue
			elseif string_capture_upper then--" close
				local close_i,close_e = string.find(source,char3,ptr)
				if close_i and close_i < newline then
					local i = close_i-1
					if string.byte(source,i)==92 then
						local n = 0
						while string.byte(source,i)==92 do
							i-=1
							n+=1
						end
						if not bit32.btest(n,0b1) then
							string_capture_upper=false
							ptr=(close_e::number)+1
							continue
						end
						ptr=(close_e::number)+1
						continue
					end
					string_capture_upper=false
					ptr=(close_e::number)+1
					continue
				end
				ptr=newline+1
				parse_line+=1
				continue
			elseif string_capture_lower then--' lower close
				local close_i,close_e = string.find(source,char4,ptr)
				if close_i and close_i < newline then
					local i = close_i-1
					if string.byte(source,i)==92 then
						local n = 0
						while string.byte(source,i)==92 do
							i-=1
							n+=1
						end
						if not bit32.btest(n,0b1) then
							string_capture_lower=false
							ptr=(close_e::number)+1
							continue
						end
						ptr=(close_e::number)+1
						continue
					end
					string_capture_lower=false
					ptr=(close_e::number)+1
					continue
				end
				ptr=newline+1
				parse_line+=1
				continue
			end

			--	[[Openers]]
			local i = string.find(source,UniversalPattern,ptr)
			if not i or i>newline then
				ptr=newline+1
				parse_line+=1
				continue
			end

			local b = string.byte(source,i)
			if b==91 then--[
				--Ensure its a %[=*%[
				local t,e = string.find(source,MatchCase,i)
				local stringPatternSearch = string.find(source,StringOnlyPattern,ptr)
				if not t or t > newline or (stringPatternSearch and (stringPatternSearch < t)) then
					i = stringPatternSearch
					if not i or i > newline then
						ptr=newline+1
						parse_line+=1
						continue
					end
					b = string.byte(source,i)
				else
					--Safe [[]]
					captured=true
					findMatch = char1..string.rep(char2,(e::number)-(t::number)-1)..char1
					ptr=(e::number)+1
					continue
				end
			end
			if b==34 then--"
				string_capture_upper=true
				ptr=(i::number)+1
				continue
			elseif b==39 then--'
				string_capture_lower=true
				ptr=(i::number)+1
				continue
			end
			string_capture_interpl=true
			ptr=(i::number)+1
			continue
		end
		local c = 1
		while c < char_position do
			--	[[Closers]]
			if string_capture_interpl then--` interpolation close
				local close_i,close_e = string.find(line,char5,c,true)
				if not close_i or close_i >= char_position then break end

				local i = close_i-1
				local n = 0

				while string.byte(line,i)==92 do
					i-=1
					n+=1
				end
				if not bit32.btest(n,0b1) then
					string_capture_interpl=false
					c=close_i+1
					continue
				end

				c=close_i+1
				continue
			elseif captured then-- ]] close
				local close_i,close_e = string.find(line,findMatch,c,true)
				if not close_i or close_i >= char_position then break end

				captured=false
				c=close_i
				continue
			elseif string_capture_upper then-- " close
				local close_i,close_e = string.find(line,char3,c,true)
				if not close_i or close_i >= char_position then break end

				local i = close_i-1
				local n = 0

				while string.byte(line,i)==92 do
					i-=1
					n+=1
				end
				if not bit32.btest(n,0b1) then
					string_capture_upper=false
					c=close_i+1
					continue
				end

				c=close_i+1
				continue
			elseif string_capture_lower then-- ' lower close
				local close_i,close_e = string.find(line,char4,c,true)
				if not close_i or close_i >= char_position then break end

				local i = close_i-1
				local n = 0

				while string.byte(line,i)==92 do
					i-=1
					n+=1
				end
				if not bit32.btest(n,0b1) then
					string_capture_lower=false
					c=close_i+1
					continue
				end

				c=close_i+1
				continue
			end
			--	[[Openers]]

			local i = string.find(line,UniversalPattern,c)
			if not i or i>char_position then break end--Nothing here to open
			local b = string.byte(line,i)

			if b==91 then--[
				--Ensure its a %[=*%[
				local t,e = string.find(line,MatchCase,i)
				local stringPatternSearch = string.find(line,StringOnlyPattern,c)
				if not t or t > char_position or (stringPatternSearch and stringPatternSearch < t) then
					i = stringPatternSearch
					if not i or i > char_position then break end
					b = string.byte(line,i)
				else
					--Safe [[]]
					captured=true
					findMatch = char1..string.rep(char2,(e::number)-(t::number)-1)..char1
					c=(e::number)+1
					continue
				end
			end
			if b==34 then--"
				string_capture_upper=true
				c=(i::number)+1
				continue
			elseif b==39 then--'
				string_capture_lower=true
				c=(i::number)+1
				continue
			end
			string_capture_interpl=true
			c=(i::number)+1
			continue
		end
	end

	return captured or string_capture_upper or string_capture_lower or string_capture_interpl
end

local AutoCompletionCallback = function(request:Request, response:Response):Response
	local txt_doc = request.textDocument
	local doc,script = txt_doc.document,txt_doc.script
	if not doc or not script or GetScript(doc)~=script then return response end
	local position = request.position
	local line_n = position.line
	local char_position = position.character
	local line = GetLine(doc,line_n)
	local inc,inc_end = string.find(line,"^%s*%-?%-?#?incl?u?d?e?")
	if inc then
		if IsInsideString(GetEditorSource(ScriptEditorService,script),line_n,char_position,line) then return response end
		inc_end = (inc_end::number)+1
		local items = response.items
		local _start_include = string.find(line,"#include")
		if not _start_include then
			local include_item = table.clone(include_item)
			local tab:start_end = {start={line=line_n,character=inc};["end"]={line=line_n,character=inc_end::number}}
			include_item.textEdit = {insert=tab,replace=tab,newText="--#include "}
			table.insert(items,include_item)
			return response
		end
		--include exists, show variants

		if not inc_end or string.find(string.sub(line,_start_include,char_position),">") then return response end

		local replace_template = {
			start={line=line_n;character=inc_end},
			["end"]={line=line_n,character=char_position}
		};
		local textEditDetails:textEdit = {
			newText = "";
			replace = replace_template;
			insert = replace_template;
		};
		local include_header:item = {
			label="";
			kind=Enum.CompletionItemKind.Value;
			tags={Enum.CompletionItemTag.TypeCorrect};
			detail = "Header";preselect=true;
		}
		local checkLocals = Local_Headers[script]
		if checkLocals then
			for i,v in checkLocals do
				local textEdit = table.clone(textEditDetails::any)::textEdit
				local label = "<"..i..">"
				(textEdit::any).newText=" "..label.."\n"..v.."\n--\\include"
				local include_header = table.clone(include_header)::item
				include_header.label=label
				include_header.textEdit=textEdit
				include_header.codeSample=v
				include_header.documentation = {value=i.." file"};
				table.insert(items,include_header)
			end
		end
		for i,v in Header_List_Code do
			local textEdit = table.clone(textEditDetails::any)::textEdit
			local label = "<"..i..">"
			(textEdit::any).newText=" "..label.."\n"..v.."\n--\\include"
			local include_header = table.clone(include_header)::item
			include_header.label=label
			include_header.textEdit=textEdit
			include_header.codeSample=v
			include_header.documentation = {value=i.." file"};
			table.insert(items,include_header)
		end
		return response
	end
	local hea,hea_end = string.find(line,"^%s*%-?%-?#?head?e?r?")
	if hea then
		if char_position>(hea_end::number)+1 then return response end
		if IsInsideString(GetEditorSource(ScriptEditorService,script),line_n,char_position,line) then return response end
		hea_end = (hea_end::number)+1
		local header_item:item = {label="header";
			kind=Enum.CompletionItemKind.Keyword;
			detail = "Local Header Keyword";
			documentation = {value="Per script custom header"};
			codeSample = [==[--#header <MyHeader>
--[[
	print("Auto sync me please")
]]
]==]
		}
		local tab:start_end = {start={line=line_n,character=hea};["end"]={line=line_n,character=hea_end::number}}
		header_item.textEdit = {insert=tab,replace=tab,newText="--#header <Header>\n--[==[\n\t\n]==]"}
		table.insert(response.items,header_item)
		return response
	end
	return response
end
local __try,__err = pcall(RegisterAutocompleteCallback::any,ScriptEditorService,"#Include_YS",5,AutoCompletionCallback)
if not __try then
	warn(__err)
	local temp2 = coroutine.running()
	warn("[Include]: No access to write scripts; callbacks cannot be loaded.")
	local OutlineColor = Color3.new(0.275,0.498,0.698)
	local SequenceColor_Cache = ColorSequence.new(Color3.new(0.847,0.91,0.984),Color3.new(0.616,0.788,0.957))

	local ErrorFrame = Instance.new("Frame") do
		SetProperty(ErrorFrame,"BackgroundColor3",Color3_White)
		SetProperty(ErrorFrame,"BorderSizePixel",0)
		SetProperty(ErrorFrame,"Size",UDim2_one)
	end
	--[Children] {
	local ErrorImage = Instance.new("ImageLabel") do
		SetProperty(ErrorImage,"AnchorPoint",Vector2_Half)
		SetProperty(ErrorImage,"BackgroundTransparency",1)
		SetProperty(ErrorImage,"Image","rbxassetid://101266206703626")
		SetProperty(ErrorImage,"Position",UDim2_Half)
		SetProperty(ErrorImage,"Size",UDim2_Half)
		SetProperty(ErrorImage,"ZIndex",2)
		SetProperty(ErrorImage,"Parent",ErrorFrame)
	end
	Instance.new("UIAspectRatioConstraint",ErrorImage)
	local RetryButton = Instance.new("TextButton") do
		SetProperty(RetryButton,"AnchorPoint",Vector2.new(0.5,1))
		SetProperty(RetryButton,"BackgroundColor3",Color3_White)
		SetProperty(RetryButton,"BorderSizePixel",0)
		SetProperty(RetryButton,"FontFace",Font_)
		SetProperty(RetryButton,"Position",UDim2.new(0.5,0,1,-10))
		SetProperty(RetryButton,"Size",UDim2.fromScale(0.2,0.2))
		SetProperty(RetryButton,"Text","Retry")
		SetProperty(RetryButton,"TextColor3",OutlineColor)
		SetProperty(RetryButton,"TextScaled",true)
		SetProperty(RetryButton,"ZIndex",2)
		SetProperty(RetryButton,"Parent",ErrorFrame)
	end
	--[Children] {
	local UIGradient = Instance.new("UIGradient") do
		SetProperty(UIGradient,"Color",SequenceColor_Cache)
		SetProperty(UIGradient,"Rotation",-90)
		SetProperty(UIGradient,"Parent",RetryButton)
	end
	local UICorner = Instance.new("UICorner") do
		SetProperty(UICorner,"CornerRadius",UDim.new(0.2,0))
		SetProperty(UICorner,"Parent",RetryButton)
	end
	local UIStroke = Instance.new("UIStroke") do
		SetProperty(UIStroke,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(UIStroke,"Color",OutlineColor)
		SetProperty(UIStroke,"Thickness",5)
		SetProperty(UIStroke,"Parent",RetryButton)
	end
	--}
	local UIGradient_1 = Instance.new("UIGradient") do
		SetProperty(UIGradient_1,"Color",SequenceColor_Cache)
		SetProperty(UIGradient_1,"Rotation",90)
		SetProperty(UIGradient_1,"Parent",ErrorFrame)
	end
	local TextLabel = Instance.new("TextLabel") do
		SetProperty(TextLabel,"AnchorPoint",Vector2_Half_Zero)
		SetProperty(TextLabel,"BackgroundTransparency",1)
		SetProperty(TextLabel,"FontFace",Font_)
		SetProperty(TextLabel,"Position",UDim2.new(0.5,0,0,15))
		SetProperty(TextLabel,"Size",UDim2.fromScale(1,0.2))
		SetProperty(TextLabel,"Text","No script injection permission is given.")
		SetProperty(TextLabel,"TextColor3",OutlineColor)
		SetProperty(TextLabel,"TextScaled",true)
		SetProperty(TextLabel,"ZIndex",2)
		SetProperty(TextLabel,"Parent",ErrorFrame)
	end
	--}
	Connect(GetProperty(RetryButton,"MouseButton1Click"),function():()
		local try = pcall(RegisterAutocompleteCallback::any,ScriptEditorService,"#Include_YS",5,AutoCompletionCallback)
		if not try then return end
		Destroy(ErrorFrame)
		coroutine.resume(temp2::thread)
	end)

	SetProperty(ErrorFrame,"Parent",Widget)
	coroutine.yield()
end

--analisys
type Request_Analysis = {
	["script"]: LuaSourceContainer,
}

type Response_Analysis = {
	diagnostics:Diagnostics_Analysis_List
}
type Diagnostics_Analysis_List = {
	[number]:Diagnostics_Analysis
};
type Diagnostics_Analysis = {
	range: {
		start: {
			line: number,
			character: number,
		},
		["end"]: {
			line: number,
			character: number,
		},
	},
	code: string?,
	message: string,
	severity: Enum.Severity?,
	codeDescription: { href: string }?,
}




local ScriptAnalysisFunctionCallback = function(req:Request_Analysis):Response_Analysis
	local Local_Headers = Local_Headers
	local diagnostics:Diagnostics_Analysis_List = {}
	local response:Response_Analysis = {diagnostics=diagnostics}
	local script = req.script
	local local_header = Local_Headers[script]
	if not local_header then
		local_header = {}
		Local_Headers[script]=local_header
		Once(GetPropertyChangedSignal(script,"Parent"),function():()
			Local_Headers[script]=nil
		end)
	end

	local src = GetEditorSource(ScriptEditorService,script)

	local stack:{[number]:{line:number,char:number,key:string}} = {} -- simple stack: { line, char, key }
	local stackLen = 0

	local lineNum = 1
	local pos = 1

	while true do
		local s,e,key = string.find(src, "%-%-#include%s*<([%w_%.]-)>", pos)
		local cs,ce = string.find(src, "%-%-\\include", pos)
		local ls, le = string.find(src, "%[%[", pos)

		if ls and (not s or ls < s) and (not cs or ls < cs) then
			local le_end = string.find(src, "%]%]", le)
			if not le_end then break end
			--fix linting name in string [[]] and "" captured
			local le_end2 = le_end+2
			local _, newlines = string.gsub(string.sub(src, pos, le_end), "\n", "")
			lineNum += newlines
			pos = le_end2 -- skip the long string
			continue
		end

		-- check for regular strings '..." or `...`
		local rs, re = string.find(src, "['\"`]", pos)
		if rs and (not s or rs < s) and (not cs or rs < cs) then
			local quote = string.sub(src, rs, rs)
			local i = rs + 1
			while i <= #src do
				local ch = string.sub(src, i, i)
				if ch == "\\" then
					i += 2 -- skip escape
				elseif ch == quote then
					break
				else
					i += 1
				end
			end
			local _, newlines = string.gsub(string.sub(src, pos, i), "\n", "")
			lineNum += newlines
			pos = i + 1 -- skip the string entirely
			continue
		end

		-- pick the earliest match
		if s and (not cs or s <= cs) then
			-- count newlines up to match
			--local _, newlines = string.gsub(string.sub(src, pos, s-1), "\n", "")
			--lineNum = lineNum + newlines
			local lastNewline = pos - 1
			local searchPos = pos

			while true do
				local nlStart, nlEnd = string.find(src,"\n",searchPos)
				if not nlStart or nlStart >= s::number then break end
				lineNum += 1
				lastNewline = nlEnd::number
				searchPos = nlEnd::number + 1
			end

			local column = s - lastNewline::number

			-- include opener
			stackLen = stackLen + 1
			stack[stackLen] = {line = lineNum, char = column, key = key::string}

			--scan key
			if key then
				if not Header_List_Code[key] and not local_header[key] then
					local _,start_pos = string.find(src,"%-%-#include%s*<",s)

					table.insert(diagnostics, {
						range = {
							start = { line = lineNum, character = start_pos::number-lastNewline::number },
							["end"]  = { line = lineNum, character = column + (e::number - s::number)+1 },
						},
						code="Header Missing",
						message = "Header not found",
						severity = Enum.Severity.Hint,
					}::Diagnostics_Analysis)
				end
			end
			pos = e::number + 1
		elseif cs then
			-- include closer
			if stackLen == 0 then
				local lineOffset = 0
				local lastNewline = pos - 1
				local searchPos = pos

				while true do
					local nlStart, nlEnd = string.find(src,"\n",searchPos)
					if not nlStart or nlStart >= cs then break end
					lineOffset += 1
					lastNewline = nlEnd::number
					searchPos = nlEnd::number + 1
				end

				local column = cs - lastNewline::number
				local line = lineNum + lineOffset

				table.insert(diagnostics, {
					range = {
						start = { line = line, character = column },
						["end"]  = { line = line, character = column + (ce::number - cs)+1 },
					},
					code = "Syntax Error",
					message = "Closing --\\include with no matching --#include",
					severity = Enum.Severity.Warning,
				}::Diagnostics_Analysis)
			else
				stack[stackLen] = nil
				stackLen -= 1
			end

			-- count newlines up to match
			local _, newlines = string.gsub(string.sub(src, pos, cs-1), "\n", "")
			lineNum = lineNum + newlines

			pos = ce::number + 1
		else
			break
		end
	end

	-- report unclosed includes
	for _, open in stack do
		table.insert(diagnostics,{
			range = {
				start = { line = open.line, character = open.char },
				["end"] = { line = open.line, character = open.char + 10},
			},
			code = "Syntax Error",
			message = "Unclosed include "..open.key::string.." - missing --\\include",
			severity = Enum.Severity.Warning,
		}::Diagnostics_Analysis)
	end


	return response
end


Connect(GetProperty(ScriptAnalisis,"MouseButton1Click"),function():()
	local new = not ScriptAnalisis_bool
	ScriptAnalisis_bool = new
	if new then
		SetProperty(ScriptAnalisis,"Image","rbxassetid://109151099907737")
		RegisterScriptAnalysisCallback(ScriptEditorService,"Include_YS_Analysis",5,ScriptAnalysisFunctionCallback)
		return
	end
	SetProperty(ScriptAnalisis,"Image","rbxassetid://122176948949160")
	DeregisterScriptAnalysisCallback(ScriptEditorService,"Include_YS_Analysis")
end)

if ScriptAnalisis_bool then
	SetProperty(ScriptAnalisis,"Image","rbxassetid://109151099907737")
	RegisterScriptAnalysisCallback(ScriptEditorService,"Include_YS_Analysis",5,ScriptAnalysisFunctionCallback)
else
	SetProperty(ScriptAnalisis,"Image","rbxassetid://122176948949160")
end


local SaveFunction = function():()
	local Path_String = Path_String
	local Path_String_len = #Path_String
	local len = 4+Path_String_len
	local buff = buffer.create(len)
	buffer.writeu8(buff,0,SaveDelay)
	local b = if AutoSave then 1 else 0
	if ScriptAnalisis_bool then
		b = bit32.bor(b,0b10)
	end
	if VolumeEnabled then
		b = bit32.bor(b,0b100)
	end
	buffer.writeu8(buff,1,b)
	buffer.writeu8(buff,2,SoundVolumeMult*255)
	buffer.writeu8(buff,3,Path_String_len)
	buffer.writestring(buff,4,Path_String)
	local EntryPtr = len
	for i,v in Header_List_Code do
		local i_len = #i
		local v_len = #v
		local Cost = 5+i_len+v_len+EntryPtr
		if len<Cost then
			local new_buff_len = math.max(len+len,Cost)
			local new_buff = buffer.create(new_buff_len)
			buffer.copy(new_buff,0,buff,0,EntryPtr)
			buff=new_buff
			len=new_buff_len
		end
		buffer.writeu8(buff,EntryPtr,i_len)
		EntryPtr+=1
		buffer.writestring(buff,EntryPtr,i)
		EntryPtr+=i_len
		buffer.writeu32(buff,EntryPtr,v_len)
		EntryPtr+=4
		buffer.writestring(buff,EntryPtr,v)
		EntryPtr+=v_len
	end
	if len>EntryPtr then
		local shrink = buffer.create(EntryPtr)
		buffer.copy(shrink,0,buff,0,EntryPtr)
		buff = shrink
	end

	buff = Base64Encode(EncodingService,CompressBuffer(EncodingService,buff,Enum.CompressionAlgorithm.Zstd))
	local str = buffer.readstring(buff,0,buffer.len(buff))
	SetSetting(plugin,"Include_Plugin_YS",str)
end
local AutoSave_Function:()->()
local SaveThread:thread
AutoSave_Function = function():()
	SaveThread = task.delay(SaveDelay,AutoSave_Function)
	SaveFunction()
end
if AutoSave then
	SaveThread = task.delay(SaveDelay,AutoSave_Function)
end

local SettingTab_Alive = false
local Vector2_Zero_Half = Vector2.new(0,0.5)
local UDim2_new0_10_1_i25 = UDim2.new(0,10,1,-25)
local UDim2_new1_i65_0_5 = UDim2.new(1,-65,0,5)
local UDim2_fromOffset10_20 = UDim2.fromOffset(10,20)
local UDim2_fromOffset10_10 = UDim2.fromOffset(10,10)
local UDim2_fromOffset_60_10 = UDim2.fromOffset(60,10)

local cache_pos = table.create(255)::{UDim2}
for i=1,255 do
	cache_pos[i]=UDim2.fromScale(i/255,0.5)
end
cache_pos[0]=UDim2.fromScale(0,0.5)

Connect(GetProperty(Settings,"MouseButton1Click"),function():()
	if SettingTab_Alive then return end
	SettingTab_Alive=true
	local Window,Bar = CreateWindow("Settings")
	Once(GetProperty(Window,"Destroying"),function():()
		SettingTab_Alive=false
	end)
	local SaveFunction = SaveFunction

	local SliderPos = 0
	local SliderSize = 0


	local DragConnection:RBXScriptConnection

	--[Children] {
	local Slider = Instance.new("ImageButton") do
		SetProperty(Slider,"AnchorPoint",Vector2_Zero_Half)
		SetProperty(Slider,"AutoButtonColor",false)
		SetProperty(Slider,"BackgroundColor3",BorderColor)
		SetProperty(Slider,"BorderSizePixel",0)
		SetProperty(Slider,"Position",UDim2_new0_10_1_i25)
		SetProperty(Slider,"Size",UDim2_new1_i65_0_5)
		SetProperty(Slider,"Parent",Window)
	end
	Connect(GetPropertyChangedSignal(Slider,"AbsolutePosition"),function():()
		SliderPos = GetVector2(GetProperty(Slider,"AbsolutePosition")::Vector2,"X")
	end)
	Connect(GetPropertyChangedSignal(Slider,"AbsoluteSize"),function():()
		SliderSize = GetVector2(GetProperty(Slider,"AbsoluteSize")::Vector2,"X")
	end)
	--[Children] {
	local SliderHandle = Instance.new("ImageButton") do
		SetProperty(SliderHandle,"AnchorPoint",Vector2_Half)
		SetProperty(SliderHandle,"AutoButtonColor",false)
		SetProperty(SliderHandle,"BackgroundColor3",Tab)
		SetProperty(SliderHandle,"BorderColor3",BorderColor)
		SetProperty(SliderHandle,"Position",UDim2.fromScale(SoundVolumeMult,0.5))
		SetProperty(SliderHandle,"Size",UDim2_fromOffset10_20)
		SetProperty(SliderHandle,"Parent",Slider)
		ImageButton_Hover(SliderHandle,"Volume Adjuster")
	end
	local MouseMoved = function(X:number):()
		local alpha = ((math.clamp((X - SliderPos) / SliderSize, 0, 1)*255)//1)
		SetProperty(SliderHandle,"Position",cache_pos[alpha])
		SoundVolumeMult=alpha/255
	end
	local func_begin = function(input:InputObject):()
		if InputObject_Get(input,"UserInputType")~=Enum.UserInputType.MouseButton1 then return end
		DragConnection = Connect(Main_MouseMoved,MouseMoved)
	end
	local func_end = function(input:InputObject):()
		if InputObject_Get(input,"UserInputState")~=Enum.UserInputState.End then return end
		Disconnect(DragConnection)
	end
	Connect(GetProperty(Slider,"InputBegan"),func_begin)
	Connect(GetProperty(SliderHandle,"InputBegan"),func_begin)
	Connect(GetProperty(Slider,"InputEnded"),func_end)
	Connect(GetProperty(SliderHandle,"InputEnded"),func_end)


	--}
	local VolumeEnabledButton = Instance.new("ImageButton") do
		SetProperty(VolumeEnabledButton,"AnchorPoint",Vector2.one)
		SetProperty(VolumeEnabledButton,"BackgroundTransparency",1)
		SetProperty(VolumeEnabledButton,"Position",UDim2_one)
		SetProperty(VolumeEnabledButton,"Size",UDim2_50)
		SetProperty(VolumeEnabledButton,"Parent",Window)
		ImageButton_Hover(VolumeEnabledButton,"Volume Toggle")
	end
	if VolumeEnabled then
		SetProperty(VolumeEnabledButton,"Image","rbxassetid://131950065573162")
	else
		SetProperty(VolumeEnabledButton,"Image","rbxassetid://78966475852487")
	end
	Connect(GetProperty(VolumeEnabledButton,"MouseButton1Click"),function():()
		local v = not VolumeEnabled
		VolumeEnabled=v
		if v then
			SetProperty(VolumeEnabledButton,"Image","rbxassetid://131950065573162")
			return
		else
			SetProperty(VolumeEnabledButton,"Image","rbxassetid://78966475852487")
		end
	end)
	local AutoSave_Button = Instance.new("ImageButton") do
		SetProperty(AutoSave_Button,"BackgroundTransparency",1)
		SetProperty(AutoSave_Button,"Position",UDim2_fromOffset10_10)
		SetProperty(AutoSave_Button,"Size",UDim2_50)
		SetProperty(AutoSave_Button,"Parent",Window)
		ImageButton_Hover(AutoSave_Button,"Auto Save")
	end
	if AutoSave then
		SetProperty(AutoSave_Button,"Image","rbxassetid://131950065573162")
	else
		SetProperty(AutoSave_Button,"Image","rbxassetid://78966475852487")
	end
	Connect(GetProperty(AutoSave_Button,"MouseButton1Click"),function():()
		local v = not AutoSave
		AutoSave=v
		if v then
			SaveThread = task.delay(SaveDelay,SaveFunction)
			SetProperty(AutoSave_Button,"Image","rbxassetid://131950065573162")
			return
		else
			task.cancel(SaveThread)
			SetProperty(AutoSave_Button,"Image","rbxassetid://78966475852487")
		end
	end)
	local AutoSaveDelayBox = Instance.new("TextBox") do
		SetProperty(AutoSaveDelayBox,"BackgroundTransparency",1)
		SetProperty(AutoSaveDelayBox,"ClipsDescendants",true)
		SetProperty(AutoSaveDelayBox,"ClearTextOnFocus",false)
		SetProperty(AutoSaveDelayBox,"FontFace",Font_)
		SetProperty(AutoSaveDelayBox,"Position",UDim2_fromOffset_60_10)
		SetProperty(AutoSaveDelayBox,"Size",UDim2_50)
		SetProperty(AutoSaveDelayBox,"Text",tostring(SaveDelay))
		SetProperty(AutoSaveDelayBox,"TextColor3",Color3_Black)
		SetProperty(AutoSaveDelayBox,"TextSize",35)
		SetProperty(AutoSaveDelayBox,"Parent",Window)
	end
	--}
	Connect(GetProperty(AutoSaveDelayBox,"FocusLost"),function():()
		local n = math.clamp((tonumber(GetProperty(AutoSaveDelayBox,"Text")) or 1)//1,1,256)
		SaveDelay = n
		SetProperty(AutoSaveDelayBox,"Text",tostring(n))
		if AutoSave then
			task.cancel(SaveThread)
			SaveThread = task.delay(n,SaveFunction)
		end
	end)

end)

Connect(GetProperty(Import,"MouseButton1Click")::RBXScriptSignal,function():()
	PlaySound("rbxassetid://103866342467024",2)
	local Font_ = Font_
	local SkipMerge_Conflict = false--If false then override existing matches
	local Merge = false

	local Window,Bar = CreateWindow("Include: Import Data")
	local Paste = Instance.new("TextButton") do
		SetProperty(Paste,"AnchorPoint",Vector2_Half_One)
		SetProperty(Paste,"BackgroundColor3",Color3_White)
		SetProperty(Paste,"BorderSizePixel",0)
		SetProperty(Paste,"FontFace",Font_)
		SetProperty(Paste,"Position",UDim2_fromScale0__25_0__966)
		SetProperty(Paste,"Size",Ok_Size)
		SetProperty(Paste,"Text","Paste")
		SetProperty(Paste,"TextColor3",Color3_Black)
		SetProperty(Paste,"TextSize",50)
		SetProperty(Paste,"ZIndex",10)
		SetProperty(Paste,"Parent",Window)
	end
	--[Children] {
	local temp = Instance.new("UIGradient") do
		SetProperty(temp,"Color",Window_Gradient)
		SetProperty(temp,"Rotation",-90)
		SetProperty(temp,"Parent",Paste)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_2)
		SetProperty(temp,"Transparency",0.9)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Paste)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_1)
		SetProperty(temp,"Transparency",0.75)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Paste)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"Transparency",0.5)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Paste)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_3)
		SetProperty(temp,"Transparency",0.95)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Paste)
	end

	local Browse = Instance.new("TextButton") do
		SetProperty(Browse,"AnchorPoint",Vector2_Half_One)
		SetProperty(Browse,"BackgroundColor3",Color3_White)
		SetProperty(Browse,"BorderSizePixel",0)
		SetProperty(Browse,"FontFace",Font_)
		SetProperty(Browse,"Position",UDim2_fromScale0__75_0__966)
		SetProperty(Browse,"Size",Ok_Size)
		SetProperty(Browse,"Text","Browse")
		SetProperty(Browse,"TextColor3",Color3_Black)
		SetProperty(Browse,"TextSize",50)
		SetProperty(Browse,"ZIndex",10)
		SetProperty(Browse,"Parent",Window)
	end
	--[Children] {
	temp = Instance.new("UIGradient") do
		SetProperty(temp,"Color",Window_Gradient)
		SetProperty(temp,"Rotation",-90)
		SetProperty(temp,"Parent",Browse)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_2)
		SetProperty(temp,"Transparency",0.9)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Browse)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_1)
		SetProperty(temp,"Transparency",0.75)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Browse)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"Transparency",0.5)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Browse)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_3)
		SetProperty(temp,"Transparency",0.95)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Browse)
	end
	local Text_Label  = Instance.new("TextLabel") do
		SetProperty(Text_Label,"AnchorPoint",Vector2_Half_Zero)
		SetProperty(Text_Label,"BackgroundTransparency",1)
		SetProperty(Text_Label,"FontFace",Font_)
		SetProperty(Text_Label,"Position",AreYouSure_Pos)
		SetProperty(Text_Label,"Size",AreYouSure_Size)
		SetProperty(Text_Label,"Text","Select or Paste Save")
		SetProperty(Text_Label,"TextColor3",Color3_Black)
		SetProperty(Text_Label,"TextSize",40)
		SetProperty(Text_Label,"ZIndex",10)
		SetProperty(Text_Label,"Parent",Window)
	end
	local Icon_real = Instance.new("ImageLabel") do
		SetProperty(Icon_real,"AnchorPoint",Vector2_Half)
		SetProperty(Icon_real,"BackgroundTransparency",1)
		SetProperty(Icon_real,"Image","rbxassetid://116737068396089")
		SetProperty(Icon_real,"Position",Warning_Pos)
		SetProperty(Icon_real,"Size",Warning_Size)
		SetProperty(Icon_real,"ZIndex",10)
		SetProperty(Icon_real,"Parent",Window)
	end
	local Merge_Overide = Instance.new("TextButton") do
		SetProperty(Merge_Overide,"AnchorPoint",Vector2_Half_One)
		SetProperty(Merge_Overide,"BackgroundColor3",Color3_White)
		SetProperty(Merge_Overide,"BorderSizePixel",0)
		SetProperty(Merge_Overide,"FontFace",Font_)
		--SetProperty(Binary,"Name","Binary")
		SetProperty(Merge_Overide,"Position",UDim2_fromScale0__25_0__5)
		SetProperty(Merge_Overide,"Size",Ok_Size)
		SetProperty(Merge_Overide,"Text","Override")
		SetProperty(Merge_Overide,"TextColor3",Color3_Black)
		SetProperty(Merge_Overide,"TextSize",50)
		SetProperty(Merge_Overide,"TextTruncate",Enum.TextTruncate.SplitWord)
		SetProperty(Merge_Overide,"ZIndex",10)
		SetProperty(Merge_Overide,"Visible",false)
		SetProperty(Merge_Overide,"Parent",Window)
	end
	--[Children] {
	temp = Instance.new("UIGradient") do
		SetProperty(temp,"Color",Window_Gradient)
		SetProperty(temp,"Rotation",-90)
		SetProperty(temp,"Parent",Merge_Overide)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_2)
		SetProperty(temp,"Transparency",0.9)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Merge_Overide)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_1)
		SetProperty(temp,"Transparency",0.75)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Merge_Overide)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"Transparency",0.5)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Merge_Overide)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_3)
		SetProperty(temp,"Transparency",0.95)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Merge_Overide)
	end
	local SelectionStroke = Instance.new("UIStroke") do
		SetProperty(SelectionStroke,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(SelectionStroke,"Color",SelectionColor)
		--SetProperty(SelectionStroke,"Name","SelectionStroke")
		SetProperty(SelectionStroke,"Thickness",2)
		SetProperty(SelectionStroke,"ZIndex",10)
		SetProperty(SelectionStroke,"Parent",Merge_Overide)
	end
	--}
	Connect(GetProperty(Merge_Overide,"MouseButton1Click"),function():()
		SkipMerge_Conflict=false
		SetProperty(SelectionStroke,"Parent",Merge_Overide)
	end)

	local Mergle_Skip = Instance.new("TextButton") do
		SetProperty(Mergle_Skip,"AnchorPoint",Vector2_Half_One)
		SetProperty(Mergle_Skip,"BackgroundColor3",Color3_White)
		SetProperty(Mergle_Skip,"BorderSizePixel",0)
		SetProperty(Mergle_Skip,"FontFace",Font_)
		--SetProperty(JSON,"Name","JSON")
		SetProperty(Mergle_Skip,"Position",UDim2_fromScale0__75_0__5)
		SetProperty(Mergle_Skip,"Size",Ok_Size)
		SetProperty(Mergle_Skip,"Text","Skip")
		SetProperty(Mergle_Skip,"TextColor3",Color3_Black)
		SetProperty(Mergle_Skip,"TextSize",50)
		SetProperty(Mergle_Skip,"TextTruncate",Enum.TextTruncate.SplitWord)
		SetProperty(Mergle_Skip,"ZIndex",10)
		SetProperty(Mergle_Skip,"Visible",false)
		SetProperty(Mergle_Skip,"Parent",Window)
	end
	Connect(GetProperty(Mergle_Skip,"MouseButton1Click"),function():()
		SkipMerge_Conflict=true
		SetProperty(SelectionStroke,"Parent",Mergle_Skip)
	end)
	--[Children] {
	temp = Instance.new("UIGradient") do
		SetProperty(temp,"Color",Window_Gradient)
		SetProperty(temp,"Rotation",-90)
		SetProperty(temp,"Parent",Mergle_Skip)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_2)
		SetProperty(temp,"Transparency",0.9)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Mergle_Skip)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_1)
		SetProperty(temp,"Transparency",0.75)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Mergle_Skip)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"Transparency",0.5)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Mergle_Skip)
	end
	temp = Instance.new("UIStroke") do
		SetProperty(temp,"ApplyStrokeMode",Enum.ApplyStrokeMode.Border)
		SetProperty(temp,"BorderOffset",UDim_new_0_3)
		SetProperty(temp,"Transparency",0.95)
		SetProperty(temp,"ZIndex",9)
		SetProperty(temp,"Parent",Mergle_Skip)
	end
	--}
	local MergeOrReplace = Instance.new("ImageButton") do
		SetProperty(MergeOrReplace,"AnchorPoint",Vector2_Half_One)
		SetProperty(MergeOrReplace,"BackgroundTransparency",1)
		SetProperty(MergeOrReplace,"Image","rbxassetid://93215350369553")
		--SetProperty(MergeOrReplace,"Name","MergeOrReplace")
		SetProperty(MergeOrReplace,"Position",Ok_Pos)
		SetProperty(MergeOrReplace,"Size",UDim2_50)
		SetProperty(MergeOrReplace,"Parent",Window)
	end
	Connect(GetProperty(MergeOrReplace,"MouseButton1Click"),function():()
		local _Merge = not Merge
		Merge=_Merge
		if _Merge then
			SetProperty(MergeOrReplace,"Image","rbxassetid://95977477286688")
			SetProperty(Merge_Overide,"Visible",true)
			SetProperty(Mergle_Skip,"Visible",true)
			SetProperty(Icon_real,"Visible",false)
			SetProperty(Text_Label,"Visible",false)
			return
		end
		SetProperty(MergeOrReplace,"Image","rbxassetid://93215350369553")
		SetProperty(Merge_Overide,"Visible",false)
		SetProperty(Mergle_Skip,"Visible",false)
		SetProperty(Icon_real,"Visible",true)
		SetProperty(Text_Label,"Visible",true)
	end)
	local ParseImport = function(str:string):()
		local Destroy = Destroy
		SelectedHeader_string = nil
		local _SelectedHeader = SelectedHeader
		SelectedHeader = nil
		if _SelectedHeader then
			SetProperty(_SelectedHeader,"BackgroundColor3",Tab)
		end
		if string.sub(str,1,4)=="KLUv" then
			--valid ZSTD format
			local buff = Base64Decode(EncodingService,buffer.fromstring(str))
			if buffer.readu32(buff,0)~=0xFD2FB528 then
				local Window,Bar = CreateWindow("Include: Import Data")
				SetProperty(Bar,"ZIndex",ZIndex_Focus+1)
				local Ok = CreateWarningWindow(Window,"Import Failed: Invalid binary!","rbxassetid://101266206703626")
				Once(GetProperty(Ok,"MouseButton1Click"),function():()
					PlaySound("rbxassetid://135757009748193",1)
					Destroy(Bar)
				end)
				PlaySound("rbxassetid://134189051248016",2)
				task.delay(5,Destroy,Bar)
				return
			end
			buff = DecompressBuffer(EncodingService,buff,Enum.CompressionAlgorithm.Zstd)
			if buffer.readu32(buff,0)~=0x44485359 then
				local Window,Bar = CreateWindow("Include: Import Data")
				SetProperty(Bar,"ZIndex",ZIndex_Focus+1)
				local Ok = CreateWarningWindow(Window,"Import Failed: Only accepts .YSHD!","rbxassetid://101266206703626")
				Once(GetProperty(Ok,"MouseButton1Click"),function():()
					PlaySound("rbxassetid://135757009748193",1)
					Destroy(Bar)
				end)
				PlaySound("rbxassetid://134189051248016",2)
				task.delay(5,Destroy,Bar)
				return
			end
			PlaySound("rbxassetid://18256020821",2)


			local _SaveDelay = buffer.readu8(buff,4)
			SaveDelay=_SaveDelay
			local pack = buffer.readu8(buff,5)
			local _AutoSave = bit32.btest(pack,0b1)
			if AutoSave then
				task.cancel(SaveThread)
			end
			AutoSave=_AutoSave
			if _AutoSave then
				SaveThread = task.delay(_SaveDelay,AutoSave_Function)
			end
			if ScriptAnalisis_bool then
				DeregisterScriptAnalysisCallback(ScriptEditorService,"Include_YS_Analysis")
			end
			local _ScriptAnalisis = bit32.btest(pack,0b10)
			ScriptAnalisis_bool=_ScriptAnalisis
			if _ScriptAnalisis then
				RegisterScriptAnalysisCallback(ScriptEditorService,"Include_YS_Analysis",5,ScriptAnalysisFunctionCallback)
			end
			VolumeEnabled = bit32.btest(pack,0b100)
			SoundVolumeMult = buffer.readu8(buff,6)/255
			local Path_len = buffer.readu8(buff,7)
			local EntryPtr = 8+Path_len
			local Path = buffer.readstring(buff,8,Path_len)
			local path = path
			SetProperty(path,"Text",Path)
			local try = pcall(ParsePath_func,Path)::boolean
			IsValidPath = try
			if try then
				SetProperty(path,"TextColor3",BrightText)
			else
				SetProperty(path,"TextColor3",Color3_Red)
				Path_Parsed = def_tab
			end


			local i = 0--slots completed
			if not Merge then
				--clean up current ones
				for i,v in Headers_Instance do
					Destroy(v)
					Headers_Instance[i]=nil
					local script = Live_ViewHeaders[i]::LuaSourceContainer?
					if script then
						Destroy(script)
					end
				end
				table.clear(Header_List_Code)
				table.clear(Header_Lower)
				table.clear(BrightText_Header_Labels)
				while EntryPtr<PluginData_len do
					i+=1
					local temp = buffer.readu8(buff,EntryPtr)
					EntryPtr+=1
					local Name = buffer.readstring(buff,EntryPtr,temp)
					EntryPtr+=temp
					temp = buffer.readu32(buff,EntryPtr)
					EntryPtr+=4
					local Code = buffer.readstring(buff,EntryPtr,temp)
					EntryPtr+=temp
					RegisterHeader(Name,Code)
				end
			else
				if SkipMerge_Conflict then
					while EntryPtr<PluginData_len do
						i+=1
						local temp = buffer.readu8(buff,EntryPtr)
						EntryPtr+=1
						local Name = buffer.readstring(buff,EntryPtr,temp)
						EntryPtr+=temp
						temp = buffer.readu32(buff,EntryPtr)
						EntryPtr+=4
						local Code = buffer.readstring(buff,EntryPtr,temp)
						EntryPtr+=temp
						if Header_Lower[string.lower(Name)] then continue end
						RegisterHeader(Name,Code)
					end
				else--Override
					while EntryPtr<PluginData_len do
						i+=1
						local temp = buffer.readu8(buff,EntryPtr)
						EntryPtr+=1
						local Name = buffer.readstring(buff,EntryPtr,temp)
						EntryPtr+=temp
						temp = buffer.readu32(buff,EntryPtr)
						EntryPtr+=4
						local Code = buffer.readstring(buff,EntryPtr,temp)
						EntryPtr+=temp

						local lower = string.lower(Name)
						local access = Header_Lower[lower]
						if access then--Also update if Name~=lower
							Header_List_Code[access]=nil
							Header_List_Code[Name]=Code
							Header_Lower[access]=nil
							Header_Lower[lower]=Name
							local ins = Headers_Instance[access]
							Headers_Instance[access]=nil
							Headers_Instance[Name]=ins
							ins = BrightText_Header_Labels[access]
							BrightText_Header_Labels[access]=nil
							BrightText_Header_Labels[Name]=ins
							SetProperty(ins,"Text",Name)
							continue
						end
						RegisterHeader(Name,Code)
					end
				end
			end
			--Past branch
			Stack_HeaderCount = i
			Stack_HeaderCount_By50 = i*50
			local Stack_Pos_Cache = Stack_Pos_Cache
			local Stack_Pos_Cache_len = #Stack_Pos_Cache

			local target = i + 1

			if i > Stack_Pos_Cache_len then
				for n = Stack_Pos_Cache_len + 1, target do
					Stack_Pos_Cache[n] = UDim2.fromOffset(0,(n-1) * 50)
				end
				Stack_Pos_Cache_len = target
			end
			SetProperty(Headers_List,"CanvasSize",Stack_Pos_Cache[target])

			local Headers_Instance = Headers_Instance
			for i,v in FindBestGuess(SearchBar_Text,Header_Lower,Stack_HeaderCount) do
				SetProperty(Headers_Instance[v],"Position",Stack_Pos_Cache[i])
			end
		else--assume json
			local try,res = pcall(JSONDecode,HttpService,str)
			if not try then
				local Window,Bar = CreateWindow("Include: Import Data")
				SetProperty(Bar,"ZIndex",ZIndex_Focus+1)
				local Ok = CreateWarningWindow(Window,"Import Failed: Can not parse JSON!","rbxassetid://101266206703626")
				Once(GetProperty(Ok,"MouseButton1Click"),function():()
					PlaySound("rbxassetid://135757009748193",1)
					Destroy(Bar)
				end)
				PlaySound("rbxassetid://134189051248016",2)
				task.delay(5,Destroy,Bar)
				return
			end
			PlaySound("rbxassetid://18256020821",2)
			--JSON

			local try,res = (pcall::(typeof(JSONDecode),HttpService,string)->(boolean,JSON_Export))(JSONDecode,HttpService,str)
			if not try then
				local Window,Bar = CreateWindow("Include: Import Data")
				SetProperty(Bar,"ZIndex",ZIndex_Focus+1)
				local Ok = CreateWarningWindow(Window,"Import Failed: Can not parse JSON!","rbxassetid://101266206703626")
				Once(GetProperty(Ok,"MouseButton1Click"),function():()
					PlaySound("rbxassetid://135757009748193",1)
					Destroy(Bar)
				end)
				PlaySound("rbxassetid://134189051248016",2)
				task.delay(5,Destroy,Bar)
				return
			end
			local JSON = res::JSON_Export

			--[[
				JSON (legacy): {
					Path:string;
					Analysis:boolean;
					AutoSave:boolean;
					VolumeEnabled:boolean;
					SoundVolumeMult:number;
					SaveDelay:number;
					Headers: {
						Title:string;
						Code:string
					}
				}
			]]
			local path = path
			local Path = JSON.Path

			local _SaveDelay = math.clamp((tonumber(JSON.SaveDelay) or 1)//1,1,256)
			SaveDelay=_SaveDelay

			SetProperty(path,"Text",Path)
			local try = pcall(ParsePath_func,Path)::boolean
			IsValidPath = try
			if try then
				SetProperty(path,"TextColor3",BrightText)
			else
				SetProperty(path,"TextColor3",Color3_Red)
				Path_Parsed = def_tab
			end
			ScriptAnalisis_bool=JSON.Analysis
			local _AutoSave = JSON.AutoSave
			if AutoSave then
				task.cancel(SaveThread)
			end
			AutoSave=_AutoSave
			if _AutoSave then
				SaveThread = task.delay(_SaveDelay,AutoSave_Function)
			end
			if ScriptAnalisis_bool then
				DeregisterScriptAnalysisCallback(ScriptEditorService,"Include_YS_Analysis")
			end
			local _ScriptAnalisis = JSON.Analysis
			ScriptAnalisis_bool=_ScriptAnalisis
			if _ScriptAnalisis then
				RegisterScriptAnalysisCallback(ScriptEditorService,"Include_YS_Analysis",5,ScriptAnalysisFunctionCallback)
			end
			VolumeEnabled = JSON.VolumeEnabled
			SoundVolumeMult = (tonumber(JSON.SoundVolumeMult) or 255)/255
			local Headers = JSON.Headers
			local sizeIndex = 0
			if type(Headers)=="table" then
				if not Merge then
					--clean up current ones
					for i,v in Headers_Instance do
						Destroy(v)
						Headers_Instance[i]=nil
						local script = Live_ViewHeaders[i]::LuaSourceContainer?
						if script then
							Destroy(script)
						end
					end
					table.clear(Header_List_Code)
					table.clear(Header_Lower)
					table.clear(BrightText_Header_Labels)
					for i,v in Headers do
						if type(v)~="table" then continue end
						local Name = v.Title
						if type(Name)~="string" then continue end
						local Code = v.Code
						if type(Code)~="string" then continue end
						Name = string.sub(Name,1,255)
						sizeIndex+=1
						RegisterHeader(Name,Code)
					end
				else
					if SkipMerge_Conflict then
						for i,v in Headers do
							if type(v)~="table" then continue end
							local Name = v.Title
							if type(Name)~="string" then continue end
							if Header_Lower[string.lower(Name)] then sizeIndex+=1 continue end
							local Code = v.Code
							if type(Code)~="string" then continue end
							Name = string.sub(Name,1,255)
							RegisterHeader(Name,Code)
							sizeIndex+=1
						end
					else--Override
						for i,v in Headers do
							if type(v)~="table" then continue end
							local Name = v.Title
							if type(Name)~="string" then continue end
							local Code = v.Code
							if type(Code)~="string" then continue end
							Name = string.sub(Name,1,255)
							local lower = string.lower(Name)
							local access = Header_Lower[lower]
							sizeIndex+=1
							if access then--Also update if Name~=lower
								Header_List_Code[access]=nil
								Header_List_Code[Name]=Code
								Header_Lower[access]=nil
								Header_Lower[lower]=Name
								local ins = Headers_Instance[access]
								Headers_Instance[access]=nil
								Headers_Instance[Name]=ins
								ins = BrightText_Header_Labels[access]
								BrightText_Header_Labels[access]=nil
								BrightText_Header_Labels[Name]=ins
								SetProperty(ins,"Text",Name)
								continue
							end
							RegisterHeader(Name,Code)
						end
					end
				end
			end
			Stack_HeaderCount = sizeIndex
			Stack_HeaderCount_By50 = sizeIndex*50
			local Stack_Pos_Cache = Stack_Pos_Cache
			local Stack_Pos_Cache_len = #Stack_Pos_Cache

			local target = sizeIndex + 1

			if sizeIndex > Stack_Pos_Cache_len then
				for n = Stack_Pos_Cache_len + 1, target do
					Stack_Pos_Cache[n] = UDim2.fromOffset(0,(n-1) * 50)
				end
				Stack_Pos_Cache_len = target
			end
			SetProperty(Headers_List,"CanvasSize",Stack_Pos_Cache[target])

			local Headers_Instance = Headers_Instance
			for i,v in FindBestGuess(SearchBar_Text,Header_Lower,Stack_HeaderCount) do
				SetProperty(Headers_Instance[v],"Position",Stack_Pos_Cache[i])
			end
		end

		Destroy(Bar)
		local Window,Bar = CreateWindow("Import Code")
		SetProperty(Bar,"ZIndex",ZIndex_Focus+1)
		local Ok = CreateWarningWindow(Window,"Success!","rbxassetid://116737068396089")
		Once(GetProperty(Ok,"MouseButton1Click"),function():()
			PlaySound("rbxassetid://135757009748193",1)
			Destroy(Bar)
		end)
		task.delay(5,Destroy,Bar)
		PlaySound("rbxassetid://118264684563077",1)
	end

	--YSHD
	Connect(GetProperty(Paste,"MouseButton1Click"),function():()
		local script = Instance.new("Script")
		SetProperty(script,"Archivable",false)
		SetProperty(script,"RunContext",Enum.RunContext.Plugin)
		SetProperty(script,"Enabled",false)
		SetProperty(script,"Name","Include: Import Data_"..UserName)
		SetProperty(script,"Parent",game)
		UpdateSourceAsync(ScriptEditorService,script,PleasePasteSave)
		OpenScriptDocumentAsync(ScriptEditorService,script)
		local document = FindScriptDocument(ScriptEditorService,script)
		if not document then Destroy(script)
			local Window,Bar = CreateWindow("Import Code")
			SetProperty(Bar,"ZIndex",ZIndex_Focus+1)
			local Ok = CreateWarningWindow(Window,"Import Failed: Unable to retrieve a script document!","rbxassetid://101266206703626")
			Once(GetProperty(Ok,"MouseButton1Click"),function():()
				PlaySound("rbxassetid://135757009748193",1)
				Destroy(Bar)
			end)
			PlaySound("rbxassetid://134189051248016",2)
			task.delay(5,Destroy,Bar)
			return
		end
		ForceSetSelectionAsync(document,2,1)
		Once(GetProperty(document,"SelectionChanged"),function()
			local src = string.sub(GetEditorSource(ScriptEditorService,script),22)
			Destroy(script)
			ParseImport(src)
		end)
	end)
	Connect(GetProperty(Browse,"MouseButton1Click"),function():()
		local file = PromptImportFileAsync(StudioService,AllowedExtensions)
		if not file then
			Destroy(Bar)
			return
		end
		local str = GetBinaryContents(file)
		ParseImport(str)
	end)
end)


Once(Plugin_Unloading::RBXScriptSignal,function():()
	Disconnect(ThemeChangeConnection)
	SaveFunction()
	ScriptEditorService:DeregisterAutocompleteCallback("#Include_YS")
	if ScriptAnalisis_bool then
		DeregisterScriptAnalysisCallback(ScriptEditorService,"Include_YS_Analysis")
	end
	local Destroy= Destroy
	for i,v in Live_ViewHeaders do
		Destroy(v)
	end
	local ExportScript = ExportScript
	if ExportScript then
		Destroy(ExportScript)
	end
end)

SetProperty(Main,"Parent",Widget)
Disconnect(ScriptFailLoad_Connection)
