package com.chmun.myapplication;

import android.Manifest;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Environment;
import android.view.View;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.Toast;


public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    Button button;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // 권한 획득 테스트용 버튼
        button = (Button) findViewById(R.id.button);
        button.setOnClickListener(this);

        // 웹뷰로 네이버 띄우기
        //WebView webView = (WebView) findViewById(R.id.webView);
        //webView.loadUrl("https://m.naver.com");

        // 파일 시스템 사용 가능 여부 체크 -> Toast로 표출
        //boolean ret = isExternalStorageWritable();
        //Toast.makeText(this, "ExternalStorageWritable result : " + ret, Toast.LENGTH_SHORT).show();
    }

    public static boolean isExternalStorageWritable() {
        // External 파일 시스템 가져오기
        String state = Environment.getExternalStorageState();
        if (Environment.MEDIA_MOUNTED.equals(state)) {
            return true;
        }
        return false;
    }

    @Override
    public void onClick(View view) {
        int permissionCheck = ContextCompat.checkSelfPermission(this, Manifest.permission.READ_EXTERNAL_STORAGE);
        if (permissionCheck == PackageManager.PERMISSION_DENIED) {
            // 권한이 없는 경우

            // 권한 요청 코드
            ActivityCompat.requestPermissions(this, new String[]{
                    Manifest.permission.READ_EXTERNAL_STORAGE
            }, 0);
        } else {
            // 권한이 있는 경우
            Toast.makeText(this, "권한 있음", Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if(requestCode == 0) {
            if(grantResults[0] == 0) {
                Toast.makeText(this, "권한 획득", Toast.LENGTH_SHORT).show();
            } else {
                Toast.makeText(this, "거부", Toast.LENGTH_SHORT).show();
            }
        }
    }
}