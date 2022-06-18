/////////////CLASS////////////

class Card {

    constructor (name, level, count, maxLvl, style, ) {
        this.name = name;
        this.level = level;
        this.style = style;
        this.count = count;
        this.totalCount = stepr[level - 1] + count;
        this.nextLevel = (level == 14 )? 0 : stepr[level] - this.totalCount 
        this.maxLevel =  stepr[maxLvl - 1] - this.totalCount
    }
}

// const { getMaxListeners } = require('process');
 var XMLHttpRequest = require('xhr2');

//recuperation des donne remplacer par un apelle api directe a therme ?
const jsonData= require('./card.json');

const tab = jsonData.cards;

 var http = new XMLHttpRequest();
 const url = 'https://testhoo.000webhostapp.com/?userid=%23CLG8JL0Q9';
 http.open('GET', url);

 http.send();

 http.onreadystatechange=(e)=>{
     console.log(http.responseText);
 }



const stepr = [1,3,7,17,37,87,187,387,787,1587,2587,4087,7087,12087]

//step des ratio de cartes par palier


let cards = []

let test;

//rangement des cartes dans leur niveaux de raretter
tab.forEach(el => {
    if( el.maxLevel == 14){
        cards.push(new Card(el.name, el.level, el.count, el.maxLevel, 'common'));
    }
    else if( el.maxLevel == 12 ){
        cards.push(new Card(el.name, el.level, el.count, el.maxLevel, 'rare'));
    }
    else if( el.maxLevel == 9 ){
        cards.push(new Card(el.name, el.level, el.count, el.maxLevel, 'epic'));
    }
    else if( el.maxLevel == 6 ){
        cards.push(new Card(el.name, el.level, el.count, el.maxLevel, 'Legendary'));
    }
    else if( el.maxLevel == 4 ){
        cards.push(new Card(el.name, el.level, el.count, el.maxLevel, 'champion'));
    }
});



let totalCardNeeded = 0;

cards.forEach(el => {
   totalCardNeeded += el.maxLevel;
})


console.log(totalCardNeeded );



