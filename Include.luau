--!strict
--!optimize 2
local SetProperty:(ins:Instance,prop:string,val:any)->()
local GetProperty:(ins:Instance,prop:string)->any
local GetService:(DataModel:DataModel,service:string)->Instance
xpcall(function():()
	(game::any)[nil]=nil
end,function():()
	SetProperty = debug.info(2,"f")
end)
xpcall(function():()
	return (game::any)[nil]
end,function():()
	GetProperty = debug.info(2,"f")
end)
GetService = GetProperty(game,"GetService")
local RunService = GetService(game,"RunService")::RunService
if RunService:IsClient() and RunService:IsRunning() then return end
local toolbar = plugin:CreateToolbar("Include")
local button = toolbar:CreateButton("Include_OpenUI_Plugin","Open UI","rbxassetid://103819211315258","Open UI")

local widget = plugin:CreateDockWidgetPluginGui("Include_Plugin_YS",DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Float,false,false,150,150,50,50))
local HttpService = GetService(game,"HttpService")::HttpService
local ScriptEditorService = GetService(game,"ScriptEditorService")::ScriptEditorService
local Selection = GetService(game,"Selection")::Selection


local UDim2_one = UDim2.fromScale(1,1)
local UDim2_0__45_0_1_0 = UDim2.fromScale(0.45,1)
local UDim20__5_0__2 = UDim2.fromScale(0.5,0.2)
local UDim20__5_0__267 = UDim2.fromScale(0.5,0.267)
local UDim2_half = UDim2.fromScale(0.5,0.5)
local List_Frame = UDim2.new(1,-12,0,45)
local UDim2OneZero = UDim2.fromScale(1,0.5)
local UDim2_0__5_0__3 = UDim2.fromScale(0.5,0.3)
local Vector2_Half_Zero = Vector2.new(0.5,0)
local Vector2_Half = Vector2.new(0.5,0.5)
local White_Color = Color3.fromRGB(255,255,255)
local Shade:ColorSequence = ColorSequence.new(White_Color,Color3.fromRGB(52,52,52))
local Half_Shade = ColorSequence.new(White_Color,Color3.fromRGB(154,154,154))
local FONT = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal)
local UDim2_8 = UDim2.fromScale(0,0.8)
local Green = Color3.fromRGB(0,255,0)
local Red = Color3.fromRGB(255,0,0)
local Blue = Color3.fromRGB(0,208,255)
local UDim10px = UDim.new(0,10)
local UDim2_05 = UDim2.fromScale(0.5,0)
local UDim2_0__5_0__8 = UDim2.fromScale(0.5,0.8)
local UDim2_0_10_1_0 = UDim2.new(0,10,1,0)
local UDim2_0_10_0__5_0 = UDim2.new(0,10,0.5,0)
local UDim2_1_s10_0_0 = UDim2.new(1,-10,0,0)
local HEADER_UDim2_0__45 = UDim2.fromScale(0.45,0)
local HEADER_Button = UDim2.fromScale(0.183,1)

local Connect:<A>(signal:RBXScriptSignal,func:A)->RBXScriptConnection
local Once:<A>(signal:RBXScriptSignal,func:A)->RBXScriptConnection
local Destroy:(ins:Instance)->()
local GetVector2:(vec:Vector2,val:"X"|"Y")->number
local UpdateSourceAsync:(service:ScriptEditorService,script:LuaSourceContainer,callback: any)->()
local OpenScriptDocumentAsync:(service:ScriptEditorService,script: LuaSourceContainer, options: { [string]: any }?)->...any
local FindScriptDocument:(service:ScriptEditorService,script:LuaSourceContainer)->ScriptDocument
local GetEditorSource:(service:ScriptEditorService,script:LuaSourceContainer)->string
local Set_Selection:(service:Selection,selection: {Instance})->()
local Get_Selection:(service:Selection)->{Instance}
local GetScriptDocuments:(service:ScriptEditorService)->{ScriptDocument}
local GetSelectedText:(ScriptDocument)->string
local GetScript:(ScriptDocument)->LuaSourceContainer
local GetLine:(ScriptDocument,number)->string
local ForceSetSelectionAsync:(cursorLine: number, cursorCharacter: number, anchorLine: number?, anchorCharacter: number?)->...any
local IsA:(Instance,string)->boolean
local JSONDecode:(service:HttpService,string)->any
local JSONEncode:(service:HttpService,table:any)->string
local GetPropertyChangedSignal:(ins:Instance,property: string)->RBXScriptSignal
xpcall(function():()
	return (Vector2.zero::any)[nil]
end,function():()
	GetVector2 = debug.info(2,"f")
end)
JSONDecode = GetProperty(HttpService,"JSONDecode")
JSONEncode = GetProperty(HttpService,"JSONEncode")
IsA = GetProperty(plugin,"IsA")
GetPropertyChangedSignal = GetProperty(plugin,"GetPropertyChangedSignal")
Get_Selection = GetProperty(Selection,"Get")
Set_Selection = GetProperty(Selection,"Set")
GetEditorSource = GetProperty(ScriptEditorService,"GetEditorSource")
GetScriptDocuments = GetProperty(ScriptEditorService,"GetScriptDocuments")
OpenScriptDocumentAsync = GetProperty(ScriptEditorService,"OpenScriptDocumentAsync")
FindScriptDocument = GetProperty(ScriptEditorService,"FindScriptDocument")
UpdateSourceAsync = GetProperty(ScriptEditorService,"UpdateSourceAsync")
local cmd = GetScriptDocuments(ScriptEditorService)[1]::ScriptDocument
ForceSetSelectionAsync = GetProperty(cmd,"ForceSetSelectionAsync")
GetSelectedText = GetProperty(cmd,"GetSelectedText")
GetScript = GetProperty(cmd,"GetScript")
GetLine = GetProperty(cmd,"GetLine")
local _random_event_temp = GetProperty(plugin,"Unloading")
Once = _random_event_temp.Once
Connect = _random_event_temp.Connect
Destroy = GetProperty(plugin,"Destroy")
SetProperty(widget,"Name","Include")
SetProperty(widget,"Title","Include")
Connect(GetProperty(button,"Click")::RBXScriptSignal,function():()
	SetProperty(widget,"Enabled",not GetProperty(widget,"Enabled")::boolean)
end)
SetProperty(button,"ClickableWhenViewportHidden",true)
local Data = plugin:GetSetting("Include_Plugin_YS") or "{}"
local try,ret = pcall(JSONDecode,HttpService,Data)
if not try then
	ret = {}::any
end
local PATH_TO_SYNC = ret.Path or ""
local HEADERS_FILE = (ret.Headers or {{Title="Test";Code="--[[Hello im a test header]]"}})::{
	[number]:{
		Title:string;
		Code:string;
	}
}
local HEADERS_LEN = #HEADERS_FILE
local Live_files = {}::{
	[Frame]:{Title:string;Code:string}
}
local LiveOrder_Ref = table.create(HEADERS_LEN)::{[number]:Frame}

local Stack_DynamicTextColorList = {}::{[TextButton|TextLabel]:true}
local Stack_DynamicFrames = {}::{[Frame]:TextButton|TextLabel}
local TargetForDeletion_Instance:Frame? = nil


local Main = Instance.new("Frame") do
	--NAME_SetProperty(Main,"Name","Main")
	SetProperty(Main,"Size",UDim2_one)
end
--[Children] {
local NewFile = Instance.new("TextButton") do
	SetProperty(NewFile,"BorderSizePixel",0)
	SetProperty(NewFile,"FontFace",FONT)
	--NAME_SetProperty(NewFile,"Name","NewFile")
	SetProperty(NewFile,"Position",UDim2_8)
	SetProperty(NewFile,"Size",UDim20__5_0__2)
	SetProperty(NewFile,"Text","New File")
	SetProperty(NewFile,"TextScaled",true)
	SetProperty(NewFile,"ZIndex",2)
	SetProperty(NewFile,"Parent",Main)
end
local ScrollingFrame = Instance.new("ScrollingFrame") do
	SetProperty(ScrollingFrame,"BorderSizePixel",0)
	SetProperty(ScrollingFrame,"ClipsDescendants",true)
	SetProperty(ScrollingFrame,"Size",UDim2_0__5_0__8)
	SetProperty(ScrollingFrame,"ZIndex",2)
	SetProperty(ScrollingFrame,"Parent",Main)
end
--[Children] {
local UIListLayout_1 = Instance.new("UIListLayout") do
	SetProperty(UIListLayout_1,"SortOrder",Enum.SortOrder.LayoutOrder)
	SetProperty(UIListLayout_1,"Parent",ScrollingFrame)
end
--}
local Sync = Instance.new("TextButton") do
	SetProperty(Sync,"BackgroundColor3",Green)
	SetProperty(Sync,"BorderSizePixel",0)
	SetProperty(Sync,"FontFace",FONT)
	--NAME_SetProperty(Sync,"Name","Sync")
	SetProperty(Sync,"Position",UDim20__5_0__2)
	SetProperty(Sync,"Size",UDim20__5_0__267)
	SetProperty(Sync,"Text","Sync")
	SetProperty(Sync,"TextScaled",true)
	SetProperty(Sync,"ZIndex",2)
	SetProperty(Sync,"Parent",Main)
end
--[Children] {
local UIGradient_3 = Instance.new("UIGradient") do
	SetProperty(UIGradient_3,"Color",Shade)
	SetProperty(UIGradient_3,"Rotation",90)
	SetProperty(UIGradient_3,"Parent",Sync)
end
--}
local Export = Instance.new("TextButton") do
	SetProperty(Export,"BackgroundColor3",Red)
	SetProperty(Export,"BorderSizePixel",0)
	SetProperty(Export,"FontFace",FONT)
	--NAME_SetProperty(Export,"Name","Export")
	SetProperty(Export,"Position",UDim2.fromScale(0.5,0.467))
	SetProperty(Export,"Size",UDim20__5_0__267)
	SetProperty(Export,"Text","Export")
	SetProperty(Export,"TextScaled",true)
	SetProperty(Export,"ZIndex",2)
	SetProperty(Export,"Parent",Main)
end
--[Children] {
local UIGradient_4 = Instance.new("UIGradient") do
	SetProperty(UIGradient_4,"Color",Shade)
	SetProperty(UIGradient_4,"Rotation",90)
	SetProperty(UIGradient_4,"Parent",Export)
end

--}
local Import = Instance.new("TextButton") do
	SetProperty(Import,"BackgroundColor3",Blue)
	SetProperty(Import,"BorderColor3",Color3.new(0,0,0))
	SetProperty(Import,"BorderSizePixel",0)
	SetProperty(Import,"FontFace",FONT)
	--NAME_SetProperty(Import,"Name","Import")
	SetProperty(Import,"Position",UDim2.fromScale(0.5,0.734))
	SetProperty(Import,"Size",UDim20__5_0__267)
	SetProperty(Import,"Text","Import")
	SetProperty(Import,"TextScaled",true)
	SetProperty(Import,"ZIndex",2)
	SetProperty(Import,"Parent",Main)
end
--[Children] {
local UIGradient_5 = Instance.new("UIGradient") do
	SetProperty(UIGradient_5,"Color",Shade)
	SetProperty(UIGradient_5,"Rotation",90)
	SetProperty(UIGradient_5,"Parent",Import)
end
--}
local path = Instance.new("TextBox") do
	SetProperty(path,"BorderSizePixel",0)
	SetProperty(path,"FontFace",FONT)
	--NAME_SetProperty(path,"Name","path")
	SetProperty(path,"PlaceholderText","game")
	SetProperty(path,"Position",UDim2_05)
	SetProperty(path,"Size",UDim20__5_0__2)
	SetProperty(path,"Text",PATH_TO_SYNC)
	SetProperty(path,"TextScaled",true)
	SetProperty(path,"ClearTextOnFocus",false)
	SetProperty(path,"Parent",Main)
end
--[Children] {
local UIGradient_6 = Instance.new("UIGradient") do
	SetProperty(UIGradient_6,"Color",Shade)
	SetProperty(UIGradient_6,"Rotation",90)
	SetProperty(UIGradient_6,"Parent",path)
end
--}
--}

--Confirm

local Confirm = Instance.new("Frame") do
	SetProperty(Confirm,"AnchorPoint",Vector2_Half)
	SetProperty(Confirm,"BorderSizePixel",0)
	--NAME_SetProperty(Confirm,"Name","Confirm")
	SetProperty(Confirm,"Position",UDim2_half)
	SetProperty(Confirm,"Size",UDim2_half)
	SetProperty(Confirm,"ZIndex",10)
	SetProperty(Confirm,"Visible",false)
	SetProperty(Confirm,"Parent",Main)
end
--[Children] {
local UICorner = Instance.new("UICorner") do
	SetProperty(UICorner,"CornerRadius",UDim10px)
	SetProperty(UICorner,"Parent",Confirm)
end
local Confirm_title = Instance.new("TextLabel") do
	SetProperty(Confirm_title,"AnchorPoint",Vector2_Half_Zero)
	SetProperty(Confirm_title,"BorderSizePixel",0)
	SetProperty(Confirm_title,"FontFace",FONT)
	SetProperty(Confirm_title,"Position",UDim2_05)
	SetProperty(Confirm_title,"Size",UDim2.fromScale(1,0.3))
	SetProperty(Confirm_title,"TextScaled",true)
	SetProperty(Confirm_title,"ZIndex",11)
	SetProperty(Confirm_title,"Parent",Confirm)
end
--[Children] {
local UICorner_1 = Instance.new("UICorner") do
	SetProperty(UICorner_1,"CornerRadius",UDim10px)
	SetProperty(UICorner_1,"Parent",Confirm_title)
end
--}
local TextHere = Instance.new("TextLabel") do
	SetProperty(TextHere,"AnchorPoint",Vector2_Half_Zero)
	SetProperty(TextHere,"BackgroundTransparency",1)
	SetProperty(TextHere,"FontFace",FONT)
	--NAME_SetProperty(TextHere,"Name","TextHere")
	SetProperty(TextHere,"Position",UDim2_0__5_0__3)
	SetProperty(TextHere,"Size",UDim2OneZero)
	SetProperty(TextHere,"Text","You sure want to delete \"Object here\" permanently?")
	SetProperty(TextHere,"TextScaled",true)
	SetProperty(TextHere,"ZIndex",11)
	SetProperty(TextHere,"Parent",Confirm)
end
local TextInputName = Instance.new("TextBox") do
	SetProperty(TextInputName,"Visible",false)
	SetProperty(TextInputName,"AnchorPoint",Vector2_Half_Zero)
	SetProperty(TextInputName,"BackgroundTransparency",1)
	SetProperty(TextInputName,"FontFace",FONT)
	--NAME_SetProperty(TextInputName,"Name","TextInputName")
	SetProperty(TextInputName,"PlaceholderText","Name here")
	SetProperty(TextInputName,"Position",UDim2_0__5_0__3)
	SetProperty(TextInputName,"Size",UDim2OneZero)
	SetProperty(TextInputName,"Text","")
	SetProperty(TextInputName,"TextScaled",true)
	SetProperty(TextInputName,"ZIndex",11)
	SetProperty(TextInputName,"ClearTextOnFocus",false)
	SetProperty(TextInputName,"Parent",Confirm)
end
local Yes = Instance.new("Frame") do
	SetProperty(Yes,"BackgroundColor3",Green)
	SetProperty(Yes,"BorderSizePixel",0)
	--NAME_SetProperty(Yes,"Name","Yes")
	SetProperty(Yes,"Position",UDim2_0__5_0__8)
	SetProperty(Yes,"Size",UDim20__5_0__2)
	SetProperty(Yes,"ZIndex",11)
	SetProperty(Yes,"Parent",Confirm)
end
--[Children] {
local UICorner_2 = Instance.new("UICorner") do
	SetProperty(UICorner_2,"CornerRadius",UDim10px)
	SetProperty(UICorner_2,"Parent",Yes)
end
local Frame = Instance.new("Frame") do
	SetProperty(Frame,"BackgroundColor3",Green)
	SetProperty(Frame,"BorderSizePixel",0)
	SetProperty(Frame,"Size",UDim2_0_10_1_0)
	SetProperty(Frame,"ZIndex",11)
	SetProperty(Frame,"Parent",Yes)
end
--[Children] {
local UIGradient = Instance.new("UIGradient") do
	SetProperty(UIGradient,"Color",Shade)
	SetProperty(UIGradient,"Rotation",90)
	SetProperty(UIGradient,"Parent",Frame)
end
--}
local UIGradient_1 = Instance.new("UIGradient") do
	SetProperty(UIGradient_1,"Color",Shade)
	SetProperty(UIGradient_1,"Rotation",90)
	SetProperty(UIGradient_1,"Parent",Yes)
end
local Frame_1 = Instance.new("Frame") do
	SetProperty(Frame_1,"BackgroundColor3",Green)
	SetProperty(Frame_1,"BorderSizePixel",0)
	SetProperty(Frame_1,"Position",UDim2_1_s10_0_0)
	SetProperty(Frame_1,"Size",UDim2_0_10_0__5_0)
	SetProperty(Frame_1,"ZIndex",11)
	SetProperty(Frame_1,"Parent",Yes)
end
--[Children] {
local UIGradient_2 = Instance.new("UIGradient") do
	SetProperty(UIGradient_2,"Color",Half_Shade)
	SetProperty(UIGradient_2,"Rotation",90)
	SetProperty(UIGradient_2,"Parent",Frame_1)
end
--}
local TextButton_YES = Instance.new("TextButton") do
	SetProperty(TextButton_YES,"BackgroundTransparency",1)
	SetProperty(TextButton_YES,"FontFace",FONT)
	SetProperty(TextButton_YES,"Size",UDim2_one)
	SetProperty(TextButton_YES,"Text","Yes")
	SetProperty(TextButton_YES,"TextScaled",true)
	SetProperty(TextButton_YES,"ZIndex",12)
	SetProperty(TextButton_YES,"Parent",Yes)
end
--}
local No = Instance.new("Frame") do
	SetProperty(No,"BackgroundColor3",Red)
	SetProperty(No,"BorderSizePixel",0)
	--NAME_SetProperty(No,"Name","No")
	SetProperty(No,"Position",UDim2_8)
	SetProperty(No,"Size",UDim20__5_0__2)
	SetProperty(No,"ZIndex",11)
	SetProperty(No,"Parent",Confirm)
end
--[Children] {
local UICorner_3 = Instance.new("UICorner") do
	SetProperty(UICorner_3,"CornerRadius",UDim10px)
	SetProperty(UICorner_3,"Parent",No)
end
local Frame_2 = Instance.new("Frame") do
	SetProperty(Frame_2,"BackgroundColor3",Red)
	SetProperty(Frame_2,"BorderSizePixel",0)
	SetProperty(Frame_2,"Position",UDim2_1_s10_0_0)
	SetProperty(Frame_2,"Size",UDim2_0_10_1_0)
	SetProperty(Frame_2,"ZIndex",11)
	SetProperty(Frame_2,"Parent",No)
end
--[Children] {
local UIGradient_3 = Instance.new("UIGradient") do
	SetProperty(UIGradient_3,"Color",Shade)
	SetProperty(UIGradient_3,"Rotation",90)
	SetProperty(UIGradient_3,"Parent",Frame_2)
end
--}
local UIGradient_4 = Instance.new("UIGradient") do
	SetProperty(UIGradient_4,"Color",Shade)
	SetProperty(UIGradient_4,"Rotation",90)
	SetProperty(UIGradient_4,"Parent",No)
end
local Frame_3 = Instance.new("Frame") do
	SetProperty(Frame_3,"BackgroundColor3",Red)
	SetProperty(Frame_3,"BorderSizePixel",0)
	SetProperty(Frame_3,"Size",UDim2_0_10_0__5_0)
	SetProperty(Frame_3,"ZIndex",11)
	SetProperty(Frame_3,"Parent",No)
end
--[Children] {
local UIGradient_5 = Instance.new("UIGradient") do
	SetProperty(UIGradient_5,"Color",Half_Shade)
	SetProperty(UIGradient_5,"Rotation",90)
	SetProperty(UIGradient_5,"Parent",Frame_3)
end
--}
local TextButton_NO = Instance.new("TextButton") do
	SetProperty(TextButton_NO,"BackgroundTransparency",1)
	SetProperty(TextButton_NO,"FontFace",FONT)
	SetProperty(TextButton_NO,"Size",UDim2_one)
	SetProperty(TextButton_NO,"Text","No")
	SetProperty(TextButton_NO,"TextScaled",true)
	SetProperty(TextButton_NO,"ZIndex",12)
	SetProperty(TextButton_NO,"Parent",No)
end
--}
--}





local Studio = GetProperty((settings::any)()::Instance,"Studio")::Studio
local Theme = GetProperty(Studio,"Theme")::StudioTheme
local GetColor = GetProperty(Theme,"GetColor")::(theme:StudioTheme,styleguideitem: Enum.StudioStyleGuideColor, modifier: Enum.StudioStyleGuideModifier?)-> Color3
local ItemColor = GetColor(Theme,Enum.StudioStyleGuideColor.Item)
local BrightTextColor = GetColor(Theme,Enum.StudioStyleGuideColor.BrightText)
local DimmedTextColor = GetColor(Theme,Enum.StudioStyleGuideColor.DimmedText)
local ScrollBarBackground = GetColor(Theme,Enum.StudioStyleGuideColor.ScrollBarBackground)
local ScrollBarColor = GetColor(Theme,Enum.StudioStyleGuideColor.ScrollBar)
local BorderColor = GetColor(Theme,Enum.StudioStyleGuideColor.Border)
local MainBackground = GetColor(Theme,Enum.StudioStyleGuideColor.MainBackground)


SetProperty(Confirm_title,"BackgroundColor3",ItemColor)
SetProperty(Confirm,"BackgroundColor3",MainBackground)
SetProperty(NewFile,"BackgroundColor3",BorderColor)
SetProperty(ScrollingFrame,"BackgroundColor3",ScrollBarBackground)
SetProperty(ScrollingFrame,"ScrollBarImageColor3",ScrollBarColor)
SetProperty(TextButton_YES,"TextColor3",BrightTextColor)
SetProperty(TextButton_NO,"TextColor3",BrightTextColor)
SetProperty(TextInputName,"TextColor3",BrightTextColor)
SetProperty(Confirm_title,"TextColor3",BrightTextColor)
SetProperty(TextHere,"TextColor3",BrightTextColor)
SetProperty(Sync,"TextColor3",BrightTextColor)
SetProperty(Export,"TextColor3",BrightTextColor)
SetProperty(Import,"TextColor3",BrightTextColor)
SetProperty(NewFile,"TextColor3",BrightTextColor)
SetProperty(path,"TextColor3",BrightTextColor)
SetProperty(path,"PlaceholderColor3",DimmedTextColor)
SetProperty(TextInputName,"PlaceholderColor3",DimmedTextColor)

Connect(GetProperty(NewFile,"MouseButton1Click")::RBXScriptSignal,function():()
	if GetProperty(Confirm,"Visible")::boolean then return end
	TargetForDeletion_Instance=nil
	SetProperty(Confirm_title,"Text","Create File?")
	SetProperty(TextInputName,"Visible",true)
	SetProperty(TextHere,"Visible",false)
	SetProperty(Confirm,"Visible",true)
end)

Connect(GetProperty(TextButton_YES,"MouseButton1Click")::RBXScriptSignal,function():()
	if TargetForDeletion_Instance then
		--deletion
		Live_files[TargetForDeletion_Instance]=nil
		local ref = table.find(LiveOrder_Ref,TargetForDeletion_Instance)
		if ref then
			table.remove(LiveOrder_Ref,ref)
		end
		local Label = Stack_DynamicFrames[TargetForDeletion_Instance]
		Stack_DynamicTextColorList[Label]=nil
		Stack_DynamicFrames[TargetForDeletion_Instance]=nil
		Destroy(TargetForDeletion_Instance)
		SetProperty(Confirm,"Visible",false)
		TargetForDeletion_Instance=nil
		return
	end
	--creating new
	local Title:string = GetProperty(TextInputName,"Text")::string
	if #Title<2 then
		SetProperty(TextHere,"Visible",true)
		SetProperty(TextInputName,"Visible",false);
		SetProperty(Confirm,"Visible",false);
		return
	end
	for i,v in Live_files do
		if v.Title==Title then
			SetProperty(TextHere,"Visible",true)
			SetProperty(TextInputName,"Visible",false);
			SetProperty(Confirm,"Visible",false);
			return
		end
	end
	local profile = {Title=Title;Code=""}
	--generating headers:

	local Frame = Instance.new("Frame") do
		SetProperty(Frame,"BackgroundColor3",ItemColor)
		SetProperty(Frame,"BorderSizePixel",0)
		SetProperty(Frame,"Size",List_Frame)
		SetProperty(Frame,"ZIndex",3)
	end
	--[Children] {
	local TextLabel = Instance.new("TextLabel") do
		SetProperty(TextLabel,"BackgroundTransparency",1)
		SetProperty(TextLabel,"FontFace",FONT)
		SetProperty(TextLabel,"Size",UDim2_0__45_0_1_0)
		SetProperty(TextLabel,"Text",Title)
		SetProperty(TextLabel,"TextColor3",BrightTextColor)
		SetProperty(TextLabel,"TextScaled",true)
		SetProperty(TextLabel,"TextXAlignment",Enum.TextXAlignment.Left)
		SetProperty(TextLabel,"ZIndex",4)
		SetProperty(TextLabel,"Parent",Frame)
	end
	Stack_DynamicTextColorList[TextLabel]=true
	Stack_DynamicFrames[Frame]=TextLabel
	local Open_File = Instance.new("TextButton") do
		SetProperty(Open_File,"BackgroundColor3",Green)
		SetProperty(Open_File,"BorderSizePixel",0)
		SetProperty(Open_File,"FontFace",FONT)
		--NAME_SetProperty(Open_File,"Name","Open_File")
		SetProperty(Open_File,"Position",HEADER_UDim2_0__45)
		SetProperty(Open_File,"Size",HEADER_Button)
		SetProperty(Open_File,"Text","Open")
		SetProperty(Open_File,"TextScaled",true)
		SetProperty(Open_File,"ZIndex",5)
		SetProperty(Open_File,"Parent",Frame)
	end
	local function ReturnSource(content:string):string
		return profile.Code
	end
	Connect(GetProperty(Open_File,"MouseButton1Click")::RBXScriptSignal,function():()
		local module = Instance.new("ModuleScript")
		SetProperty(module,"Name",profile.Title.." Export")
		SetProperty(module,"Archivable",false)
		SetProperty(module,"Parent",game)
		Set_Selection(Selection,{module})
		UpdateSourceAsync(ScriptEditorService,module,ReturnSource)
		OpenScriptDocumentAsync(ScriptEditorService,module)
	end)
	--[Children] {
	local UIGradient = Instance.new("UIGradient") do
		SetProperty(UIGradient,"Color",Shade)
		SetProperty(UIGradient,"Rotation",90)
		SetProperty(UIGradient,"Parent",Open_File)
	end
	--}
	local Paste_Code = Instance.new("TextButton") do
		SetProperty(Paste_Code,"BackgroundColor3",Blue)
		SetProperty(Paste_Code,"BorderSizePixel",0)
		SetProperty(Paste_Code,"FontFace",FONT)
		--NAME_SetProperty(Paste_Code,"Name","Paste Code")
		SetProperty(Paste_Code,"Position",UDim2.fromScale(0.633,0))
		SetProperty(Paste_Code,"Size",HEADER_Button)
		SetProperty(Paste_Code,"Text","Paste Code")
		SetProperty(Paste_Code,"TextScaled",true)
		SetProperty(Paste_Code,"ZIndex",5)
		SetProperty(Paste_Code,"Parent",Frame)
	end
	Connect(GetProperty(Paste_Code,"MouseButton1Click")::RBXScriptSignal,function():()
		local documents = GetScriptDocuments(ScriptEditorService)
		local selection:string?=nil
		for i,v in documents do
			local text = GetSelectedText(v)::string
			if text=="" then continue end
			selection=text
		end
		if not selection then 
			for i,v in Get_Selection(Selection) do
				if not IsA(v,"LuaSourceContainer") then continue end
				profile.Code = GetEditorSource(ScriptEditorService,v)
				return
			end
			warn("[Include]: Please select code snippet first.")
			return
		end
		profile.Code=selection
	end)
	--[Children] {
	local UIGradient_1 = Instance.new("UIGradient") do
		SetProperty(UIGradient_1,"Color",Shade)
		SetProperty(UIGradient_1,"Rotation",90)
		SetProperty(UIGradient_1,"Parent",Paste_Code)
	end
	--}
	local Delete = Instance.new("TextButton") do
		SetProperty(Delete,"BackgroundColor3",Red)
		SetProperty(Delete,"BorderSizePixel",0)
		SetProperty(Delete,"FontFace",FONT)
		--NAME_SetProperty(Delete,"Name","Delete")
		SetProperty(Delete,"Position",UDim2.fromScale(0.816,0))
		SetProperty(Delete,"Size",HEADER_Button)
		SetProperty(Delete,"Text","Delete")
		SetProperty(Delete,"TextScaled",true)
		SetProperty(Delete,"ZIndex",5)
		SetProperty(Delete,"Parent",Frame)
	end
	Connect(GetProperty(Delete,"MouseButton1Click")::RBXScriptSignal,function():()
		TargetForDeletion_Instance=Frame
		SetProperty(Confirm_title,"Text","Ok?")
		SetProperty(TextHere,"Text","Would you like to delete \""..Title.."\" file permanently?")
		SetProperty(Confirm,"Visible",true)
	end)
	--[Children] {
	local UIGradient_2 = Instance.new("UIGradient") do
		SetProperty(UIGradient_2,"Color",Shade)
		SetProperty(UIGradient_2,"Rotation",90)
		SetProperty(UIGradient_2,"Parent",Delete)
	end
	--}
	--}
	Live_files[Frame]=profile
	table.insert(LiveOrder_Ref,Frame)
	SetProperty(Frame,"Parent",ScrollingFrame)
	SetProperty(TextHere,"Visible",true)
	SetProperty(TextInputName,"Visible",false)
	SetProperty(Confirm,"Visible",false)
end)
Connect(GetProperty(TextButton_NO,"MouseButton1Click")::RBXScriptSignal,function():()
	if TargetForDeletion_Instance then
		SetProperty(Confirm,"Visible",false)
		return
	end
	SetProperty(TextHere,"Visible",true)
	SetProperty(TextInputName,"Visible",false)
	SetProperty(Confirm,"Visible",false)
end)

for i,v in HEADERS_FILE do
	local Title = tostring(v.Title) or "Unknown"
	local profile = {Title=Title;Code=tostring(v.Code) or "--Error"}::{Title:string;Code:string}
	--generating headers:

	local Frame = Instance.new("Frame") do
		SetProperty(Frame,"BackgroundColor3",ItemColor)
		SetProperty(Frame,"BorderSizePixel",0)
		SetProperty(Frame,"Size",List_Frame)
		SetProperty(Frame,"ZIndex",3)
	end
	--[Children] {
	local TextLabel = Instance.new("TextLabel") do
		SetProperty(TextLabel,"BackgroundTransparency",1)
		SetProperty(TextLabel,"FontFace",FONT)
		SetProperty(TextLabel,"Size",UDim2_0__45_0_1_0)
		SetProperty(TextLabel,"Text",Title)
		SetProperty(TextLabel,"TextColor3",BrightTextColor)
		SetProperty(TextLabel,"TextScaled",true)
		SetProperty(TextLabel,"TextXAlignment",Enum.TextXAlignment.Left)
		SetProperty(TextLabel,"ZIndex",4)
		SetProperty(TextLabel,"Parent",Frame)
	end
	Stack_DynamicTextColorList[TextLabel]=true
	Stack_DynamicFrames[Frame]=TextLabel
	local Open_File = Instance.new("TextButton") do
		SetProperty(Open_File,"BackgroundColor3",Green)
		SetProperty(Open_File,"BorderSizePixel",0)
		SetProperty(Open_File,"FontFace",FONT)
		--NAME_SetProperty(Open_File,"Name","Open_File")
		SetProperty(Open_File,"Position",HEADER_UDim2_0__45)
		SetProperty(Open_File,"Size",HEADER_Button)
		SetProperty(Open_File,"Text","Open")
		SetProperty(Open_File,"TextScaled",true)
		SetProperty(Open_File,"ZIndex",5)
		SetProperty(Open_File,"Parent",Frame)
	end
	local function ReturnSource(content:string):string
		return profile.Code
	end
	Connect(GetProperty(Open_File,"MouseButton1Click")::RBXScriptSignal,function():()
		local module = Instance.new("ModuleScript")
		SetProperty(module,"Name",profile.Title.." Export")
		SetProperty(module,"Archivable",false)
		SetProperty(module,"Parent",game)
		Set_Selection(Selection,{module})
		UpdateSourceAsync(ScriptEditorService,module,ReturnSource)
		OpenScriptDocumentAsync(ScriptEditorService,module)
	end)
	--[Children] {
	local UIGradient = Instance.new("UIGradient") do
		SetProperty(UIGradient,"Color",Shade)
		SetProperty(UIGradient,"Rotation",90)
		SetProperty(UIGradient,"Parent",Open_File)
	end
	--}
	local Paste_Code = Instance.new("TextButton") do
		SetProperty(Paste_Code,"BackgroundColor3",Blue)
		SetProperty(Paste_Code,"BorderSizePixel",0)
		SetProperty(Paste_Code,"FontFace",FONT)
		--NAME_SetProperty(Paste_Code,"Name","Paste Code")
		SetProperty(Paste_Code,"Position",UDim2.fromScale(0.633,0))
		SetProperty(Paste_Code,"Size",HEADER_Button)
		SetProperty(Paste_Code,"Text","Paste Code")
		SetProperty(Paste_Code,"TextScaled",true)
		SetProperty(Paste_Code,"ZIndex",5)
		SetProperty(Paste_Code,"Parent",Frame)
	end
	Connect(GetProperty(Paste_Code,"MouseButton1Click")::RBXScriptSignal,function():()
		local documents = GetScriptDocuments(ScriptEditorService)
		local selection:string?=nil
		for i,v in documents do
			local text = GetSelectedText(v)::string
			if text=="" then continue end
			selection=text
		end
		if not selection then 
			for i,v in Get_Selection(Selection) do
				if not IsA(v,"LuaSourceContainer") then continue end
				profile.Code = GetEditorSource(ScriptEditorService,v)
				return
			end
			warn("[Include]: Please select code snippet first.")
			return
		end
		profile.Code=selection
	end)
	--[Children] {
	local UIGradient_1 = Instance.new("UIGradient") do
		SetProperty(UIGradient_1,"Color",Shade)
		SetProperty(UIGradient_1,"Rotation",90)
		SetProperty(UIGradient_1,"Parent",Paste_Code)
	end
	--}
	local Delete = Instance.new("TextButton") do
		SetProperty(Delete,"BackgroundColor3",Red)
		SetProperty(Delete,"BorderSizePixel",0)
		SetProperty(Delete,"FontFace",FONT)
		--NAME_SetProperty(Delete,"Name","Delete")
		SetProperty(Delete,"Position",UDim2.fromScale(0.816,0))
		SetProperty(Delete,"Size",HEADER_Button)
		SetProperty(Delete,"Text","Delete")
		SetProperty(Delete,"TextScaled",true)
		SetProperty(Delete,"ZIndex",5)
		SetProperty(Delete,"Parent",Frame)
	end
	Connect(GetProperty(Delete,"MouseButton1Click")::RBXScriptSignal,function():()
		TargetForDeletion_Instance=Frame
		SetProperty(Confirm_title,"Text","Ok?")
		SetProperty(TextHere,"Text","Would you like to delete \""..Title.."\" file permanently?")
		SetProperty(Confirm,"Visible",true)
	end)
	--[Children] {
	local UIGradient_2 = Instance.new("UIGradient") do
		SetProperty(UIGradient_2,"Color",Shade)
		SetProperty(UIGradient_2,"Rotation",90)
		SetProperty(UIGradient_2,"Parent",Delete)
	end
	--}
	--}
	Live_files[Frame]=profile
	table.insert(LiveOrder_Ref,Frame)
	SetProperty(Frame,"Parent",ScrollingFrame)
end

--[[TO DO:
* Make export button work
* Make Import Button work
* Integrate Logic of Sync Button from ServerScriptService.ScriptTest
* Make Path exclusion work and saved in Export/Import
]]
local Iterate_List:{Instance}
local function ParsePath(input:string):{Instance}
	if input=="" then return {game} end
	local split = string.split(input::string,",")
	local _path = table.create(#split)::{Instance}
	for i,v in split do
		local dir = string.split(v,".")
		local service_=dir[1]::string
		if service_=="Parent" then _path[i]=game continue end
		local start = GetService(game,service_)
		for ii,vv in dir do
			if ii==1 or vv=="Parent" then continue end
			start=start[vv]
		end
		_path[i]=start
	end
	return _path
end
local try,ret = pcall(ParsePath,PATH_TO_SYNC)
if try then
	Iterate_List=ret
else
	SetProperty(path,"TextColor3",Blue)
	Iterate_List = {game}
end
SetProperty(path,"Text",PATH_TO_SYNC)

local rawData:string = ""
local function InsertRawData(content:string):string
	return rawData
end
Connect(GetProperty(Export,"MouseButton1Click")::RBXScriptSignal,function():()
	local tab_save = {Path=PATH_TO_SYNC}
	local headers = table.create(#LiveOrder_Ref)
	for i,v in LiveOrder_Ref do
		table.insert(headers,Live_files[v])
	end
	tab_save.Headers = headers
	rawData = JSONEncode(HttpService,tab_save)
	local module = Instance.new("ModuleScript")
	SetProperty(module,"Name","Export Data")
	SetProperty(module,"Archivable",false)
	SetProperty(module,"Parent",game)
	Set_Selection(Selection,{module})
	UpdateSourceAsync(ScriptEditorService,module,InsertRawData)
	OpenScriptDocumentAsync(ScriptEditorService,module)
end)
local Importing_process:boolean = false
local function CancelImporting():()
	Importing_process=false
end
local function PleasePasteSave(content:string):string
	return "--Please Ctrl+V save"
end
Connect(GetProperty(Import,"MouseButton1Click")::RBXScriptSignal,function():()
	if Importing_process then return end
	Importing_process=true
	
	local module = Instance.new("ModuleScript")
	
	SetProperty(module,"Name","Importing...")
	SetProperty(module,"Archivable",false)
	SetProperty(module,"Parent",game)
	Connect(GetPropertyChangedSignal(module,"Parent"),CancelImporting)
	Set_Selection(Selection,{module})
	UpdateSourceAsync(ScriptEditorService,module,PleasePasteSave)
	OpenScriptDocumentAsync(ScriptEditorService,module)
	local doc = FindScriptDocument(ScriptEditorService,module)
	if not doc then Destroy(module) warn("Failed to open the script") return end
	ForceSetSelectionAsync(doc,1,1,1,21)
	Once(GetProperty(doc,"SelectionChanged"),function():()
		local txt = GetEditorSource(ScriptEditorService,module)
		local try,tab = pcall(JSONDecode,HttpService,txt)
		if not try then
			warn("Failed to parse.")
			Destroy(module)
			return
		end
		local _Path,_Headers=tab.Path,tab.Headers
		if type(_Path)~="string" or type(_Headers)~="table" then
			warn("Incorrect format.")
			Destroy(module)
			return
		end
		for i,v in _Headers::{[any]:any} do
			if type(v.Title)~="string" or type(v.Code)~="string" then
				warn("Incorrect format.")
				Destroy(module)
				return
			end
		end
		local try,ret = pcall(ParsePath,_Path)
		if try then
			Iterate_List=ret
		else
			SetProperty(path,"TextColor3",Blue)
			Iterate_List = {game}
		end
		SetProperty(path,"Text",_Path)
		
		for i in Live_files do
			Destroy(i)
		end
		table.clear(LiveOrder_Ref)
		table.clear(Live_files)
		table.clear(Stack_DynamicTextColorList)
		table.clear(Stack_DynamicFrames)
		for i,v in _Headers do
			local Title = tostring(v.Title) or "Unknown"
			local profile = {Title=Title;Code=tostring(v.Code) or "--Error"}::{Title:string;Code:string}
			--generating headers:

			local Frame = Instance.new("Frame") do
				SetProperty(Frame,"BackgroundColor3",ItemColor)
				SetProperty(Frame,"BorderSizePixel",0)
				SetProperty(Frame,"Size",List_Frame)
				SetProperty(Frame,"ZIndex",3)
			end
			--[Children] {
			local TextLabel = Instance.new("TextLabel") do
				SetProperty(TextLabel,"BackgroundTransparency",1)
				SetProperty(TextLabel,"FontFace",FONT)
				SetProperty(TextLabel,"Size",UDim2_0__45_0_1_0)
				SetProperty(TextLabel,"Text",Title)
				SetProperty(TextLabel,"TextColor3",BrightTextColor)
				SetProperty(TextLabel,"TextScaled",true)
				SetProperty(TextLabel,"TextXAlignment",Enum.TextXAlignment.Left)
				SetProperty(TextLabel,"ZIndex",4)
				SetProperty(TextLabel,"Parent",Frame)
			end
			Stack_DynamicTextColorList[TextLabel]=true
			Stack_DynamicFrames[Frame]=TextLabel
			local Open_File = Instance.new("TextButton") do
				SetProperty(Open_File,"BackgroundColor3",Green)
				SetProperty(Open_File,"BorderSizePixel",0)
				SetProperty(Open_File,"FontFace",FONT)
				--NAME_SetProperty(Open_File,"Name","Open_File")
				SetProperty(Open_File,"Position",HEADER_UDim2_0__45)
				SetProperty(Open_File,"Size",HEADER_Button)
				SetProperty(Open_File,"Text","Open")
				SetProperty(Open_File,"TextScaled",true)
				SetProperty(Open_File,"ZIndex",5)
				SetProperty(Open_File,"Parent",Frame)
			end
			local function ReturnSource(content:string):string
				return profile.Code
			end
			Connect(GetProperty(Open_File,"MouseButton1Click")::RBXScriptSignal,function():()
				local module = Instance.new("ModuleScript")
				SetProperty(module,"Name",profile.Title.." Export")
				SetProperty(module,"Archivable",false)
				SetProperty(module,"Parent",game)
				Set_Selection(Selection,{module})
				UpdateSourceAsync(ScriptEditorService,module,ReturnSource)
				OpenScriptDocumentAsync(ScriptEditorService,module)
			end)
			--[Children] {
			local UIGradient = Instance.new("UIGradient") do
				SetProperty(UIGradient,"Color",Shade)
				SetProperty(UIGradient,"Rotation",90)
				SetProperty(UIGradient,"Parent",Open_File)
			end
			--}
			local Paste_Code = Instance.new("TextButton") do
				SetProperty(Paste_Code,"BackgroundColor3",Blue)
				SetProperty(Paste_Code,"BorderSizePixel",0)
				SetProperty(Paste_Code,"FontFace",FONT)
				--NAME_SetProperty(Paste_Code,"Name","Paste Code")
				SetProperty(Paste_Code,"Position",UDim2.fromScale(0.633,0))
				SetProperty(Paste_Code,"Size",HEADER_Button)
				SetProperty(Paste_Code,"Text","Paste Code")
				SetProperty(Paste_Code,"TextScaled",true)
				SetProperty(Paste_Code,"ZIndex",5)
				SetProperty(Paste_Code,"Parent",Frame)
			end
			Connect(GetProperty(Paste_Code,"MouseButton1Click")::RBXScriptSignal,function():()
				local documents = GetScriptDocuments(ScriptEditorService)
				local selection:string?=nil
				for i,v in documents do
					local text = GetSelectedText(v)::string
					if text=="" then continue end
					selection=text
				end
				if not selection then 
					for i,v in Get_Selection(Selection) do
						if not IsA(v,"LuaSourceContainer") then continue end
						profile.Code = GetEditorSource(ScriptEditorService,v)
						return
					end
					warn("[Include]: Please select code snippet first.")
					return
				end
				profile.Code=selection
			end)
			--[Children] {
			local UIGradient_1 = Instance.new("UIGradient") do
				SetProperty(UIGradient_1,"Color",Shade)
				SetProperty(UIGradient_1,"Rotation",90)
				SetProperty(UIGradient_1,"Parent",Paste_Code)
			end
			--}
			local Delete = Instance.new("TextButton") do
				SetProperty(Delete,"BackgroundColor3",Red)
				SetProperty(Delete,"BorderSizePixel",0)
				SetProperty(Delete,"FontFace",FONT)
				--NAME_SetProperty(Delete,"Name","Delete")
				SetProperty(Delete,"Position",UDim2.fromScale(0.816,0))
				SetProperty(Delete,"Size",HEADER_Button)
				SetProperty(Delete,"Text","Delete")
				SetProperty(Delete,"TextScaled",true)
				SetProperty(Delete,"ZIndex",5)
				SetProperty(Delete,"Parent",Frame)
			end
			Connect(GetProperty(Delete,"MouseButton1Click")::RBXScriptSignal,function():()
				TargetForDeletion_Instance=Frame
				SetProperty(Confirm_title,"Text","Ok?")
				SetProperty(TextHere,"Text","Would you like to delete \""..Title.."\" file permanently?")
				SetProperty(Confirm,"Visible",true)
			end)
			--[Children] {
			local UIGradient_2 = Instance.new("UIGradient") do
				SetProperty(UIGradient_2,"Color",Shade)
				SetProperty(UIGradient_2,"Rotation",90)
				SetProperty(UIGradient_2,"Parent",Delete)
			end
			--}
			--}
			Live_files[Frame]=profile
			table.insert(LiveOrder_Ref,Frame)
			SetProperty(Frame,"Parent",ScrollingFrame)
		end
		Destroy(module)
	end)
end)
Connect(GetProperty(path,"Focused")::RBXScriptSignal,function():()
	SetProperty(path,"TextColor3",BrightTextColor)
end)
Connect(GetProperty(path,"FocusLost")::RBXScriptSignal,function():()
	local text = GetProperty(path,"Text")
	local try,ret = pcall(ParsePath,text)
	if not try then
		SetProperty(path,"TextColor3",Red)
		return
	end
	PATH_TO_SYNC=text
	Iterate_List=ret
	SetProperty(path,"Text",text)
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


ScriptEditorService:RegisterAutocompleteCallback("#Include_YS",1,function(request:Request, response:Response):Response
	local txt_doc = request.textDocument
	local doc,script = txt_doc.document,txt_doc.script
	if not doc or not script or GetScript(doc)~=script then return response end
	local position = request.position
	local line_n = position.line
	local char_position = position.character
	local line = GetLine(doc,line_n)
	local inc,inc_end = string.find(line,"#?incl?u?d?e?")
	if not inc then return response end
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
	for i,v in Live_files do
		local Title = v.Title
		local textEdit = table.clone(textEditDetails)::textEdit
		local label = "<"..Title..">"
		(textEdit::any).newText=" "..label.."\n"..v.Code.."\n--\\include"
		local include_header = table.clone(include_header)::item
		include_header.label=label
		include_header.textEdit=textEdit
		include_header.codeSample=v.Code
		include_header.documentation = {value=Title.." file"};
		table.insert(items,include_header)
	end
	return response
end)

local function UpdateScrollbar():()
	local sizeY = GetVector2(GetProperty(UIListLayout_1,"AbsoluteContentSize"),"Y")
	SetProperty(ScrollingFrame,"CanvasSize",UDim2.fromOffset(0,sizeY))
end
Connect(GetPropertyChangedSignal(UIListLayout_1,"AbsoluteContentSize"),UpdateScrollbar)
SetProperty(ScrollingFrame,"CanvasSize",UDim2.fromOffset(0,HEADERS_LEN*45))

local connection = Connect(GetProperty(Studio,"ThemeChanged")::RBXScriptSignal,function():()
	Theme = GetProperty(Studio,"Theme")::StudioTheme
	ItemColor = GetColor(Theme,Enum.StudioStyleGuideColor.Item)
	BrightTextColor = GetColor(Theme,Enum.StudioStyleGuideColor.BrightText)
	DimmedTextColor = GetColor(Theme,Enum.StudioStyleGuideColor.DimmedText)
	ScrollBarBackground = GetColor(Theme,Enum.StudioStyleGuideColor.ScrollBarBackground)
	ScrollBarColor = GetColor(Theme,Enum.StudioStyleGuideColor.ScrollBar)
	BorderColor = GetColor(Theme,Enum.StudioStyleGuideColor.Border)
	MainBackground = GetColor(Theme,Enum.StudioStyleGuideColor.MainBackground)

	SetProperty(Confirm_title,"BackgroundColor3",ItemColor)
	SetProperty(Confirm,"BackgroundColor3",MainBackground)
	SetProperty(NewFile,"BackgroundColor3",BorderColor)
	SetProperty(ScrollingFrame,"BackgroundColor3",ScrollBarBackground)
	SetProperty(ScrollingFrame,"ScrollBarImageColor3",ScrollBarColor)
	SetProperty(TextButton_YES,"TextColor3",BrightTextColor)
	SetProperty(TextButton_NO,"TextColor3",BrightTextColor)
	SetProperty(TextInputName,"TextColor3",BrightTextColor)
	SetProperty(Confirm_title,"TextColor3",BrightTextColor)
	SetProperty(TextHere,"TextColor3",BrightTextColor)
	SetProperty(Sync,"TextColor3",BrightTextColor)
	SetProperty(Export,"TextColor3",BrightTextColor)
	SetProperty(Import,"TextColor3",BrightTextColor)
	SetProperty(NewFile,"TextColor3",BrightTextColor)
	SetProperty(path,"TextColor3",BrightTextColor)
	SetProperty(path,"PlaceholderColor3",DimmedTextColor)
	SetProperty(TextInputName,"PlaceholderColor3",DimmedTextColor)

	for i in Stack_DynamicTextColorList do
		SetProperty(i,"TextColor3",BrightTextColor)
	end
	for i in Stack_DynamicFrames do
		SetProperty(i,"BackgroundColor3",ItemColor)
	end
end)
Once(GetProperty(plugin,"Unloading")::RBXScriptSignal,function():()
	connection:Disconnect()
	local tab_save = {Path=PATH_TO_SYNC}
	local headers = table.create(#LiveOrder_Ref)
	for i,v in LiveOrder_Ref do
		headers[i]=Live_files[v]
	end
	tab_save.Headers = headers
	local res = JSONEncode(HttpService,tab_save)
	plugin:SetSetting("Include_Plugin_YS",res)
	ScriptEditorService:DeregisterAutocompleteCallback("#Include_YS")
end)

SetProperty(Main,"Parent",widget)
