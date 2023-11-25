package com.chmun.week13_2;

import android.content.Context;
import android.view.View;

public class MyGraphicView extends View {
    int startX = -1, startY = -1;
    int stopX = -1, stopY = -1;

    public static final int LINE=1, CIRCLE=2;
    public static int curShape = CIRCLE;

    public MyGraphicView(Context context) {

    }

}
