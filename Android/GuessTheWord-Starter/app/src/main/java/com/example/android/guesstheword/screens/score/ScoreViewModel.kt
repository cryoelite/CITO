package com.example.android.guesstheword.screens.score

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class ScoreViewModel(var finalScore: Int): ViewModel() {
    private val _score = MutableLiveData<Int>()
    private val _eventPlayAgain = MutableLiveData<Boolean>()
    val eventPlayAgain: LiveData<Boolean>
        get() = _eventPlayAgain
    init {
        Log.i("ScoreViewModel", "Final score is $score");
        _score.value = finalScore
    }
    val score: LiveData<Int>
        get() = _score

    fun onPlayAgain() {
        _eventPlayAgain.value = true
    }
    fun onPlayAgainComplete() {
        _eventPlayAgain.value = false
    }
}