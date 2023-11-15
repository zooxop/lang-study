package com.chmun.week11_assignment;

import androidx.appcompat.app.AppCompatActivity;

import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    EditText etA, etB, etN;
    Button buttonLCM, buttonPrime;
    IMyAidlInterface mCalc;

    ServiceConnection srvConn = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            mCalc = IMyAidlInterface.Stub.asInterface(iBinder);
        }

        @Override
        public void onServiceDisconnected(ComponentName componentName) {
            mCalc = null;
        }
    };


    @Override
    protected void onResume() {
        super.onResume();
        Intent intent = new Intent("com.mch.AIDL_EXAMPLE");
        intent.setPackage("com.chmun.week11_assignment");
        bindService(intent, srvConn, BIND_AUTO_CREATE);
    }

    @Override
    protected void onPause() {
        super.onPause();
        unbindService(srvConn);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        etA = (EditText) findViewById(R.id.etA);
        etB = (EditText) findViewById(R.id.etB);
        etN = (EditText) findViewById(R.id.etN);
        buttonLCM = (Button) findViewById(R.id.buttonLCM);
        buttonPrime = (Button) findViewById(R.id.buttonPrime);

        buttonLCM.setOnClickListener(this);
        buttonPrime.setOnClickListener(this);
    }

    @Override
    public void onClick(View view) {
        if (view.getId() == R.id.buttonLCM) {
            int LCM = 0;
            try {
                LCM = mCalc.getLCM(Integer.parseInt(etA.getText().toString()), Integer.parseInt(etB.getText().toString()));
            } catch (RemoteException e) {
                throw new RuntimeException(e);
            }
            Toast.makeText(this, "LCM is = " + LCM, Toast.LENGTH_SHORT).show();
        } else {
            boolean prime = false;
            try {
                prime = mCalc.isPrime(Integer.parseInt(etN.getText().toString()));
            } catch (RemoteException e) {
                throw new RuntimeException(e);
            }
            Toast.makeText(this, "Prime result = " + prime, Toast.LENGTH_SHORT).show();
        }
    }
}