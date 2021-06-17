AHKHID_UseConstants()
Connected := False
check_and_update()
OnMessage(0x219, "notify_change")

LAlt::LWin
LWin::LAlt                                                                                                            

Return

notify_change(wParam, lParam, msg, hwnd) 
{
    check_and_update()
    ;MsgBox, %wParam% %lParam% %msg% %hwnd% 
}

check_and_update(){
    AHKHID_Initialize(True)
    detect_connected()
}

detect_connected(){
    ;Get count
    iCount := AHKHID_GetDevCount()
    Connected := False
    Loop %iCount% {
        
        HID0 += 1
        
        ;Get device handle, type and name
        Name          := AHKHID_GetDevName(HID0)
        if (Name = "\\?\HID#VID_05AC&PID_0205&MI_00#8&1bbcda0d&0&0000#{884b96c3-56ef-11d1-bc8c-00a0c91405dd}")
            Connected := True 
        
    }
    
    if Connected {
        Suspend, Off
    } else {
        Suspend, On
    }
}
