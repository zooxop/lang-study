package com.chmun.week09;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    SharedPreferences sharedPreferences;
    EditText editText;
    Button button;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        editText = (EditText) findViewById(R.id.editText1);
        button = (Button) findViewById(R.id.button);
        button.setOnClickListener(this);
        sharedPreferences = getSharedPreferences("Android", Context.MODE_PRIVATE);

        if(sharedPreferences != null) {
            editText.setText(sharedPreferences.getString("Name", ""));
        }
    }

    @Override
    public void onClick(View view) {
        if(sharedPreferences != null) {
            SharedPreferences.Editor editor = sharedPreferences.edit();
            editor.putString("Name", editText.getText().toString());
            editor.commit();
        }
    }
}