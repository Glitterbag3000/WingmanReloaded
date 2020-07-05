﻿#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
SaveDir := RegExReplace(A_ScriptDir, "data$", "save")
; SetWorkingDir %SaveDir%

    Global rxNum := "(?!\+1 )(?!1 (?!to \d))(?!\+1\%)(?!1\%)"
    . "(?!\d{1,} second)"
    . "(?!\d{1,} Poisons)"
    . "(?!\d{1,} Rampage)"
    . "(?!\d{1,} Dexterity)"
    . "(?!\d{1,} total Dexterity)"
    . "(?!\d{1,} Intelligence)"
    . "(?!\d{1,} total Intelligence)"
    . "(?!\d{1,} Strength)"
    . "(?!\d{1,} total Strength)"
    . "\+{0,1}"
    . "(\d{1,}\.{0,1}\,{0,1}\d{0,})"
    . "\%{0,1}"
    Global Bases
    FileRead, JSONtext, %A_ScriptDir%\Bases.json
    Bases := JSON.Load(JSONtext)

Global PoESessionID := ""
, AccountNameSTR := ""
, selectedLeague := "Harvest"

IniRead, PoESessionID, %SaveDir%\Account.ini, GGG, PoESessionID, %A_Space%

; AccountNameSTR := POE_RequestAccount().accountName

; RecipeArray := {}
; Object := POE_RequestStash(13,1)
; For i, content in Object.items
; {
;   item := new ItemBuild(content,Object.quadLayout)
;   ; Array_Gui(item)
;   If (item.Prop.ChaosRecipe || item.Prop.RegalRecipe)
;   {
;     If !IsObject(RecipeArray[item.Prop.SlotType])
;       RecipeArray[item.Prop.SlotType] := {}
;     RecipeArray[item.Prop.SlotType].Push(item)
;   }
; }
Object := ChaosRecipe(13)
Array_Gui(Object)
ExitApp

#Include %A_ScriptDir%/Library.ahk


; frameType := Rarity
; 0 = Normal, 1 = Magic, 2 = Rare, 3 = Unique
; 4 = Gem, 5 = Currency, 6 = Div

; NamePlate Block
; typeLine := ItemBase
; Name := ItemName
; for magic and normal items, Name will be ""

; flavourText or descrText to make FlavorText Block

; explicitMods to make Affix Block
; veiled > Suffix or Prefix to Affix Block
; craftedMods
; enchantMods (enchant)
; fracturedMods
; implicitMods to make Implicit Block
; make sure to add (implicit)
; utilityMods for flask implicit

; Properties Block
; requirements > Level, Str, Agi, Int
; properties > Quality, Armour, Energy Shield, Evasion Rating
  ; , Physical Damage, Elemental Damage, Critical Strike Chance
  ; , Attacks per Second, Weapon Range

; properties	[ItemLineContent{

  ; name	string

  ; values	[
  ;   Tuple where the first value is the display string. The second value describes how the value should be displayed:
  ;  ]

  ; displayMode	number
  ;   Possible values:

  ;   0 - name should be displayed as `${name}: ${values.join(', ')}` if values.length > 0 otherwise just '${name}'
  ;   1 - name should be displayed as `${values[0]} ${name}`
  ;   2 - name__ should be display as \${progressBar(values[0])} ${values[0]}` i.e. name is not displayed
  ;   3 - name field contains placeholders for the values in the format of %\d. The number nth value in values (0-based)

  ; type	number
  ;   The order in which the lines should be displayed

; ilvl
; identified
; corrupted
; isRelic

; w h for Item_Width and Item_Height