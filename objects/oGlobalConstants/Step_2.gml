if (global.time_delta >= 1) { // we keep the delta under 1 to avoid overflowing
    global.time_delta -= 1;  // also it's much easier to compare
}

global.time_delta += global.time_dilation;
