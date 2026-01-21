static const char norm_fg[] = "#dfdad2";
static const char norm_bg[] = "#08090C";
static const char norm_border[] = "#9c9893";

static const char sel_fg[] = "#dfdad2";
static const char sel_bg[] = "#85796A";
static const char sel_border[] = "#dfdad2";

static const char urg_fg[] = "#dfdad2";
static const char urg_bg[] = "#797065";
static const char urg_border[] = "#797065";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
