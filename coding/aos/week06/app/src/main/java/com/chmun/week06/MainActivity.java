package com.chmun.week06;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity implements AdapterView.OnItemClickListener, View.OnClickListener, AdapterView.OnItemLongClickListener {
    final String[] tv = {
            "무빙",
            "마스크걸",
            "오징어게임",
            "카지노",
            "유퀴즈",
            "놀면 뭐하니",
            "최강야구",
            "나는 솔로",
            "나 혼자 산다",
            "SNL"
    };

    String[] tvFromResource;

    ListView listView;
    EditText editText;
    Button button;
    ArrayList<String> dynamicTv;
    ArrayAdapter<String> adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        listView = (ListView) findViewById(R.id.listView);
        listView.setOnItemClickListener(this);

        // 1. Simple list itme 1
//        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, tv);
//        listView.setAdapter(adapter);

        // 2. Radio button style
//        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_single_choice, tv);
//        listView.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
//        listView.setAdapter(adapter);

        // 3. Checkbox style
//        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_multiple_choice, tv);
//        listView.setChoiceMode(ListView.CHOICE_MODE_MULTIPLE);
//        listView.setAdapter(adapter);

        // 4. Resource 에서 가져오기 => 추후에 바뀔 가능성이 잦은 데이터를 보여주는 경우는 이렇게 관리하는 경우가 더 유연하게 대처할 수 있음.
//        tvFromResource = getResources().getStringArray(R.array.tv);
//        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, tvFromResource);
//        listView.setAdapter(adapter);

        // 5. 동적 아이템 추가
        editText = (EditText) findViewById(R.id.editText);

        button = (Button) findViewById(R.id.button);
        button.setOnClickListener(this);

        listView = (ListView) findViewById(R.id.listView);
        listView.setOnItemClickListener(this);
        listView.setOnItemLongClickListener(this);

        dynamicTv = new ArrayList<String>();
        adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, dynamicTv);

        listView.setAdapter(adapter);
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
        Toast.makeText(this, tv[i], Toast.LENGTH_SHORT).show();
    }

    @Override
    public void onClick(View view) {
        dynamicTv.add(editText.getText().toString());
        editText.setText("");
        adapter.notifyDataSetChanged();
    }

    @Override
    public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
        dynamicTv.remove(i);
        adapter.notifyDataSetChanged();
        return false;
    }
}