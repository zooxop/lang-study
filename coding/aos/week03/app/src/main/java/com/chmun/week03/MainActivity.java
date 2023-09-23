package com.chmun.week03;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    Button button1;
    Button buttonNextActivity;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Log.d("MainActivity", "onCreate");

        this.button1 = (Button) findViewById(R.id.button1);
        this.button1.setOnClickListener(this);

        this.buttonNextActivity = (Button) findViewById(R.id.buttonNextActivity);
        this.buttonNextActivity.setOnClickListener(this);
    }

    @Override
    protected void onResume() {
        super.onResume();
        Log.d("MainActivity", "onResume");
    }

    @Override
    protected void onPause() {
        super.onPause();
        Log.d("MainActivity", "onPause");
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        Log.d("MainActivity", "onDestroy");
    }

    @Override
    public void onClick(View view) {
        int id = view.getId();

        if(R.id.button1 == id) {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.inha.ac.kr"));
            startActivity(intent);
        }

        if (R.id.buttonNextActivity == id) {
            Intent intent = new Intent(this, Activity2.class);
            startActivity(intent);
        }
    }
}