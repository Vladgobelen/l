#! /bin/env lua
local signal_file_name = '.signall1'
local signal_file = "os.getenv('HOME')..'/'..signal_file_name";
local file = io.open(signal_file);

if(file) then
    local stat = file:read('*all');
    file:close();
    if stat == 'working' then
       file = io.open(signal_file,'w');
       file:write('stop');
       return 0;
    else
       file = io.open(signal_file,'w');
       file:write('working');
       file:close();
    end

    while(true) do
        file = io.open(signal_file);
        stat = file:read('*all');
        file:close();
        if stat == 'working' then
            os.execute("xdotool mousemove 700 100 click 3 key Alt+Tab utimer -t 300ms");
        else 
            break;
        end
    end
end
