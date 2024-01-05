{
    services.dunst = {
        enable = true;
        settings = {
            global = {
                frame_color = "#ffb52a";
                origin = "top-right";
                offset = "5x40";
                padding = 8;
                separator_height = 2;
                gap_size = 10;
            };
            urgency_low = {
                frame_color = "#73999E";
                background = "#0d161b";
                foreground = "#cbc5c1";
                timeout = 10;
            };
            urgency_normal = {
                background = "#0d161b";
                foreground = "#cbc5c1";
                timeout = 10;
            };
            urgency_high = {
                background = "#bd2c40";
                foreground = "#cbc5c1";
                timeout = 10;
            };
        };
    };
}