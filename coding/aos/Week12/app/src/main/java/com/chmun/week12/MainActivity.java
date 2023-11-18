package com.chmun.week12;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.view.View;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    WebView webView;
    EditText editText;
    Button button;
    TextView textView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        this.webView = (WebView) findViewById(R.id.webView);
        this.webView.setWebViewClient(new WebViewClient());
        //this.webView.loadUrl("https://m.naver.com");

        this.editText = (EditText) findViewById(R.id.editText);
        this.button = (Button) findViewById(R.id.button);
        this.textView = (TextView) findViewById(R.id.textView);
        this.button.setOnClickListener(this);
    }

    @Override
    public void onClick(View view) {
        ConnectivityManager manager = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo info = manager.getActiveNetworkInfo();
        if (info != null) {
            this.textView.setText(info.toString());
        }
        String url = editText.getText().toString();
        this.webView.loadUrl(url);
    }
}