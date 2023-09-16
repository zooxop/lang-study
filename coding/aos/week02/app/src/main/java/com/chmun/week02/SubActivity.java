package com.chmun.week02;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;

public class SubActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sub);

        // 앞선 Activity에서 넘겨준 Intent 객체 가져오기.
        Intent intent = getIntent();

        // intent에서 key로 값 가져오기
        String id = intent.getStringExtra("id");
        String pw = intent.getStringExtra("pw");

        // 가져온 값 TextView에 표시
        TextView tv = (TextView) findViewById(R.id.textView);
        tv.setText("ID = " + id + ", Password = " + pw);

        Log.d("inha", "ID = " + id + ", Password = " + pw);
    }
}