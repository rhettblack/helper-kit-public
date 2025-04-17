-- This file is part of SA MoonLoader package.
-- Licensed under the MIT License.
-- Copyright (c) 2016, BlastHack Team <blast.hk>


local keys_onfoot = {
	GOLEFT_GORIGHT = 0,
	GOFORWARD_GOBACK = 1,
	ANSWERPHONE_FIREWEAPONALT = 4,
	CYCLEWEAPONLEFT_SNIPERZOOMIN = 5,
	LOCKTARGET = 6,
	CYCLEWEAPONRIGHT_SNIPERZOOMOUT = 7,
	GROUPCONTROLFWD = 8,
	GROUPCONTROLBWD = 9,
	CONVERSATIONNO = 10,
	CONVERSATIONYES = 11,
	CHANGECAMERAVIEW = 13,
	JUMP = 14,
	ENTERVEHICLE = 15,
	SPRINT = 16,
	FIREWEAPON = 17,
	CROUCH = 18,
	LOOKBEHIND = 19,
	WALK = 21
}

local keys_incar = {
	GOLEFT_GORIGHT = 0,
	STEERUP_STEERDOWN = 1,
	TURRETLEFT_TURRETRIGHT = 2,
	TURRETUP_TURRETDOWN = 3,
	FIREWEAPONALT = 4,
	LOOKLEFT = 5,
	HANDBRAKE = 6,
	LOOKBEHIND_LOOKRIGHT = 7,
	RADIOSTATIONUP = 8,
	RADIOSTATIONDOWN = 9,
	CONVERSATIONNO = 10,
	CONVERSATIONYES = 11,
	CHANGECAMERAVIEW = 13,
	BRAKE = 14,
	EXITVEHICLE = 15,
	ACCELERATE = 16,
	FIREWEAPON = 17,
	HORN = 18,
	TOGGLESUBMISSION = 19
}

return {player = keys_onfoot, vehicle = keys_incar}
