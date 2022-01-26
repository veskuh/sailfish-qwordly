/*
BSD 3-Clause License

Copyright (c) 2022, Vesa-Matti Hartikainen
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

*/

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    Column {
        anchors.fill: parent
        PageHeader {
            title: "About"
        }
        LinkedLabel {
            plainText: "This game is based on excellent online game called Wordle.
See: https://www.powerlanguage.co.uk/wordle/ Original game works very well in Sailfish Browser. \
If you want to play with English words you should check the original. \
This Sailfish version only supports finnish words for now"

            width: page.width - 2 * Theme.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter
            shortenUrl: true
        }


        SectionHeader {
            text: "How to play"
        }
        Label {
            text: "You are trying to guess a finnish word, which is 5 letters long. \
You have six attempts. Enter the word with keys at the bottom of the screen. \
Once you have entered 5 letters, you can press enter to submit the guess. \
Correct letters that are in correct place will be highlighted \
in <i>green</i> and correct letters that are in wrong position will be highlighted with <b style=\"color:orange;\">orange</b>. \
Additionally, wrong letters are marked in <a>red</a> on the keypad."
            width: page.width - 2 * Theme.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter
            color: Theme.highlightColor
            wrapMode: Text.WordWrap
        }
        SectionHeader {
            text: "License"
        }
        Label {
            text: "This Sailfish version is licensed under BSD and authored by Vesa-Matti Hartikainen. \
See github for sources https://github.com/veskuh/sailfish-qwordly"
            width: page.width - 2 * Theme.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter
            color: Theme.highlightColor
            wrapMode: Text.WordWrap
        }
    }
}
