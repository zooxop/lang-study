package com.chmun.week03;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;

public class Activity2 extends AppCompatActivity implements View.OnClickListener {

    Button button2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_2);
        Log.d("Activity2", "onCreate");

        button2 = (Button) findViewById(R.id.button2);
        button2.setOnClickListener(this);
    }

    @Override
    protected void onResume() {
        super.onResume();
        Log.d("Activity2", "onResume");
    }

    @Override
    protected void onPause() {
        super.onPause();
        Log.d("Activity2", "onPause");
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        Log.d("Activity2", "onDestroy");
    }

    @Override
    public void onClick(View view) {
        Intent intent = new Intent(this, Activity3.class);
        startActivity(intent);
    }
}