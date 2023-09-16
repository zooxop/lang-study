package com.chmun.week02;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    EditText etID;
    EditText etPW;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Life cycle check :: onCreate
        Log.d("inha", "onCreate");

        // TextView 객체 가져오기
        TextView tv = (TextView) findViewById(R.id.tvtest);
        tv.setText("Login");

        // EditText 객체 가져오기
        this.etID = (EditText) findViewById(R.id.editTextText);
        this.etPW = (EditText) findViewById(R.id.editTextPassword);

        // Button 객체 가져오기
        Button button = (Button) findViewById(R.id.button);

        // Button OnclickListener 추가
        button.setOnClickListener(this);
    }

    @Override
    public void onClick(View view) {
        // 사용자 입력값 가져오기
        String id = etID.getText().toString();
        String pw = etPW.getText().toString();

        // Intent 객체 생성. (화면 전환할 때 사용함)
        Intent intent = new Intent(this, SubActivity.class);

        // 전달시킬 값들을 key-value로 참조할 수 있도록 추가.
        intent.putExtra("id", id);
        intent.putExtra("pw", pw);

        // SubActivity로 화면 전환. (push 또는 present)
        startActivity(intent);
    }

    @Override
    protected void onStart() {
        super.onStart();
        // Life cycle check :: onStart
        Log.d("inha", "onStart");
    }

    @Override
    protected void onResume() {
        super.onResume();
        // Life cycle check :: onResume
        Log.d("inha", "onResume");
    }

    @Override
    protected void onPause() {
        super.onPause();
        // Life cycle check :: onPause
        Log.d("inha", "onPause");
    }

    @Override
    protected void onRestart() {
        super.onRestart();
        // Life cycle check :: onRestart
        Log.d("inha", "onRestart");
    }

    @Override
    protected void onStop() {
        super.onStop();
        // Life cycle check :: onStop
        Log.d("inha", "onStop");
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        // Life cycle check :: onDestroy
        Log.d("inha", "onDestroy");
    }
}