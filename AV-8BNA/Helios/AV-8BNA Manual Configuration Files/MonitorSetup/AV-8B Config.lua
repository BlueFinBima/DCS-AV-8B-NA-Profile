_  = function(p) return p; end;
name = _('AV-8B Config');
Description = 'AV-8B MFCD, ODU, UFC etc.  GUI Config'
--        x = displays[1].width + displays[2].width + 0;


if  displays and #displays >2 then
    primary = 
    {
        x 		= displays[1].x - screen.x;
        y 		= displays[1].y - screen.y;
        width   = displays[1].width;
        height  = displays[1].height;
        aspect  = displays[1].width/displays[1].height;
        viewDx  = 0;
        viewDy  = 0;
    }
    GUI=
    {
        x 		= displays[2].x - screen.x;
        y 		= displays[2].y - screen.y;
        width   = displays[2].width;
        height  = displays[2].height;
        aspect  = displays[2].width/displays[2].height;
    } 
    UIMainView = primary

xo = displays[2].width;
-- xo = 0;

    LEFT_MFCD = 

    {

        x = displays[1].width + xo + 0;

        y = 0;

        width = 334;

        height = 312;

    }

    RIGHT_MFCD = 

    {
        x = displays[1].width + xo + 340;
        y = 0;
        width = 334;
        height = 312;
    }
    Viewports = {primary}
else
    primary =
         {
             x = 0;
             y = 0;
             width = screen.width;
             height = screen.height;
             viewDx = 0;
             viewDy = 0;
             aspect = screen.aspect;
         }
    UIMainView = primary
    Viewports = {primary}

end
