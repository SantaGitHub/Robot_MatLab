function robot()
x='w'; %Сторона по горизонтали
y='n'; %Сторона по вертикали
r = Rob_abs('ROB_1.map');
r.mark();
flag = false;
if((r.is_bord(x) == false)&&(r.is_bord(y) == false))    %Робот идет до какого-нибудь угла, если не в углу
    flag = step_rob(r,x,flag);
    flag = step_rob(r,y,flag);
end
step_down(r,x,y,flag)
end
function flag = step_rob(r,x,flag_mark)
storona = x;
flag = flag_mark;
while r.is_bord(storona) == false
r.step(storona)
if(flag == 1)
    r.mark()
    flag = 0;
else
    if(flag == 0)
        flag = 1;
    end
end
end
end
function step_down(r,x,y,flag)
flag_r=flag;
disp(x)
disp(y)
br_y=invert_bord(y);
br_x=invert_bord(x);
disp(br_y)
disp(br_x)
while r.is_bord(br_y) == false
    while r.is_bord(br_x) == false
    r.step(br_x)
        if(flag_r == 1)
            r.mark()
            flag_r = 0;
        else
        if(flag_r == 0)
            flag_r = 1;
        end
        end
    end
    if(r.is_bord(br_y) == false)
    r.step(br_y);
    end
    if(flag_r == 1)
            r.mark()
            flag_r = 0;
        else
        if(flag_r == 0)
            flag_r = 1;
        end
    end
    while r.is_bord(x) == false
    r.step(x)
        if(flag_r == 1)
            r.mark()
            flag_r = 0;
        else
        if(flag_r == 0)
            flag_r = 1;
        end
        end
    end
    if(r.is_bord(br_y) == false)
    r.step(br_y);
    end
    if(flag_r == 1)
            r.mark()
            flag_r = 0;
        else
        if(flag_r == 0)
            flag_r = 1;
        end
    end
end
end
function vert=invert_bord(x)
vert=x;
if(vert == 'n')
    vert = 's';
else if(vert == 's')
    vert = 'n';
    end
end
if(vert == 'o')
    vert = 'w';
else if(vert == 'w')
        vert = 'o';
    end
end
end