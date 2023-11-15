package com.chmun.week11_assignment;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.os.RemoteException;

import androidx.annotation.Nullable;

public class CalService extends Service {
    public CalService() {

    }

    IMyAidlInterface.Stub mBinder = new IMyAidlInterface.Stub() {
        @Override
        public int getLCM(int a, int b) throws RemoteException {
            int i;
            for(i = 1; ; i++) {
                if(i % a == 0 && i % b == 0) break;
            }

            return i;
        }

        @Override
        public boolean isPrime(int n) throws RemoteException {
            int i;
            for(i = 2; i < n; i++) {
                if (n % i == 0) return false;
            }

            return true;
        }
    };

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return mBinder;
    }
}
