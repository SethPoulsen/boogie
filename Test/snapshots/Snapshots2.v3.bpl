procedure {:checksum "P0$proc#2"} P0();
requires F0();
// Action: verify (function changed)
implementation {:checksum "P0$impl#0"} P0()
{
    call P0();
}


function {:checksum "F0#1"} F0() : bool
{
    false
}