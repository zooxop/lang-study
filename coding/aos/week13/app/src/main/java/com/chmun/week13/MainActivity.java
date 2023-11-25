package com.chmun.week13;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity implements View.OnTouchListener {

    View view;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        view = (View) findViewById(R.id.view);
        view.setOnTouchListener(this);
    }

    @Override
    public boolean onTouch(View view, MotionEvent motionEvent) {
        boolean result = false;
        float x = motionEvent.getX();
        float y = motionEvent.getY();

        switch (motionEvent.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                Toast.makeText(
                        this,
                        "onTouch ACTION_DOWN : X=" + x + ", Y=" + y,
                        Toast.LENGTH_SHORT
                ).show();
                break;
            case MotionEvent.ACTION_UP:
                Toast.makeText(
                        this,
                        "onTouch ACTION_UP : X=" + x + ", Y=" + y,
                        Toast.LENGTH_SHORT
                ).show();
                break;
            case MotionEvent.ACTION_MOVE:
                Log.d(
                        "TEST",
                        "onTouch ACTION_DOWN : X=" + x + ", Y=" + y
                );
                break;
        }

        return result;
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        boolean result = false;
        float x = event.getX();
        float y = event.getY();

        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                Toast.makeText(
                        this,
                        "onTouchEvent ACTION_DOWN : X=" + x + ", Y=" + y,
                        Toast.LENGTH_SHORT
                ).show();
                break;
            case MotionEvent.ACTION_UP:
                Toast.makeText(
                        this,
                        "onTouchEvent ACTION_UP : X=" + x + ", Y=" + y,
                        Toast.LENGTH_SHORT
                ).show();
                break;
            case MotionEvent.ACTION_MOVE:
                Log.d(
                        "TEST",
                        "onTouchEvent ACTION_DOWN : X=" + x + ", Y=" + y
                );
                break;
        }

        return result;
    }
}