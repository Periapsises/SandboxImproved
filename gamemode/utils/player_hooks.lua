local function awaitPlayerMove( ply )
    local hookName = "AwaitPlayerMove_" .. ply:SteamID()

    hook.Add( "SetupMove", hookName, function( self, _ply, _, cmd )
        if self == _ply and not cmd:IsForced() then
            hook.Run( "PlayerInitialized", self )
            hook.Remove( "SetupMove", hookName )
        end
    end )
end

hook.Add( "PlayerInitialSpawn", "SandboxImproved_AwaitPlayerMove", awaitPlayerMove )
