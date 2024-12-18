package go.cryoelite.aboutme

import android.content.Context
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.view.inputmethod.InputMethodManager
import android.widget.*
import androidx.databinding.DataBindingUtil
import go.cryoelite.aboutme.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding

    lateinit var editText: EditText;
    lateinit var nickTextView: TextView;
    lateinit var doneButton: Button;
    private val myName: MyName = MyName("Arvind Sagar!")

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)


        binding = DataBindingUtil.setContentView(this, R.layout.activity_main)


        binding.myName=myName;
        editText = binding.nicknameEdit;
        nickTextView = binding.nicknameText;
        doneButton = binding.doneButton;

        doneButton.setOnClickListener {
            clickHandler(it);
        };
        nickTextView.setOnClickListener{
            updateNick(it);
        };
    }

    private fun updateNick(clickedView: View){

        editText.visibility=View.VISIBLE;
        doneButton.visibility=View.VISIBLE;
        editText.text.clear();
        editText.text.append(nickTextView.text);
        myName.nickname="";
        nickTextView.visibility=View.GONE;

        editText.requestFocus();
        val imm = getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
        imm.showSoftInput(editText, 0)
        binding.invalidateAll();

    }

    private fun clickHandler(clickedView: View) {
        val text= editText.text.toString();
        if(text!= "" && text!= " ")
        {
            myName.nickname=text;
            editText.visibility=View.GONE;
            doneButton.visibility=View.GONE;
            nickTextView.visibility=View.VISIBLE;
            val inputMethodManager = getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
            inputMethodManager.hideSoftInputFromWindow(clickedView.windowToken, 0)
            binding.invalidateAll();
        }

    }
}