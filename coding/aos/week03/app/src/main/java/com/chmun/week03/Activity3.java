package com.chmun.week03;

import androidx.appcompat.app.AppCompatActivity;

import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;

import java.io.IOException;

public class Activity3 extends AppCompatActivity implements View.OnClickListener {

    Button buttonPlay;
    Button buttonStop;
    Button buttonRawPlay;
    AssetFileDescriptor descriptor;

    MediaPlayer mediaPlayer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_3);
        Log.d("Activity3", "onCreate");

        buttonPlay = (Button) findViewById(R.id.buttonPlay);
        buttonStop = (Button) findViewById(R.id.buttonStop);
        buttonRawPlay = (Button) findViewById(R.id.buttonRawPlay);
        buttonPlay.setOnClickListener(this);
        buttonStop.setOnClickListener(this);
        buttonRawPlay.setOnClickListener(this);

        AssetManager am = getAssets();
        try {
            descriptor = am.openFd("just_dance.mp3");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        Log.d("Activity3", "onResume");
    }

    @Override
    protected void onPause() {
        super.onPause();
        Log.d("Activity3", "onPause");
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        Log.d("Activity3", "onDestroy");
    }

    @Override
    public void onClick(View view) {
        if (view.getId() == R.id.buttonPlay) {
            try {
                mediaPlayer = new MediaPlayer();
                mediaPlayer.setDataSource(descriptor.getFileDescriptor(), descriptor.getStartOffset(), descriptor.getLength());
                descriptor.close();

                mediaPlayer.prepare();
                mediaPlayer.start();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

            return;
        }

        if (view.getId() == R.id.buttonStop) {
            mediaPlayer.stop();
            return;
        }

        if (view.getId() == R.id.buttonRawPlay) {
            mediaPlayer = MediaPlayer.create(this, R.raw.just_dance);
            mediaPlayer.start();
        }
    }
}