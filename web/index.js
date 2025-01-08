const Max16BitInt = 65535; // 2 ** 16 -1
const DoTrueRandomShuffle = true;

const Deck = [
        { face: "2",    suit: "spade",      color: "black"  },
        { face: "2",    suit: "heart",      color: "red"    },
        { face: "2",    suit: "diamond",    color: "red"    },
        { face: "2",    suit: "club",       color: "black"  },

        { face: "3",    suit: "spade",      color: "black"  },
        { face: "3",    suit: "heart",      color: "red"    },
        { face: "3",    suit: "diamond",    color: "red"    },
        { face: "3",    suit: "club",       color: "black"  },

        { face: "4",    suit: "spade",      color: "black"  },
        { face: "4",    suit: "heart",      color: "red"    },
        { face: "4",    suit: "diamond",    color: "red"    },
        { face: "4",    suit: "club",       color: "black"  },

        { face: "5",    suit: "spade",      color: "black"  },
        { face: "5",    suit: "heart",      color: "red"    },
        { face: "5",    suit: "diamond",    color: "red"    },
        { face: "5",    suit: "club",       color: "black"  },

        { face: "6",    suit: "spade",      color: "black"  },
        { face: "6",    suit: "heart",      color: "red"    },
        { face: "6",    suit: "diamond",    color: "red"    },
        { face: "6",    suit: "club",       color: "black"  },

        { face: "7",    suit: "spade",      color: "black"  },
        { face: "7",    suit: "heart",      color: "red"    },
        { face: "7",    suit: "diamond",    color: "red"    },
        { face: "7",    suit: "club",       color: "black"  },
        
        { face: "8",    suit: "spade",      color: "black"  },
        { face: "8",    suit: "heart",      color: "red"    },
        { face: "8",    suit: "diamond",    color: "red"    },
        { face: "8",    suit: "club",       color: "black"  },

        { face: "9",    suit: "spade",      color: "black"  },
        { face: "9",    suit: "heart",      color: "red"    },
        { face: "9",    suit: "diamond",    color: "red"    },
        { face: "9",    suit: "club",       color: "black"  },

        { face: "10",   suit: "spade",      color: "black"  },
        { face: "10",   suit: "heart",      color: "red"    },
        { face: "10",   suit: "diamond",    color: "red"    },
        { face: "10",    suit: "club",       color: "black"  },

        { face: "J",    suit: "spade",      color: "black"  },
        { face: "J",    suit: "heart",      color: "red"    },
        { face: "J",    suit: "diamond",    color: "red"    },
        { face: "J",    suit: "club",       color: "black"  },

        { face: "Q",    suit: "spade",      color: "black"  },
        { face: "Q",    suit: "heart",      color: "red"    },
        { face: "Q",    suit: "diamond",    color: "red"    },
        { face: "Q",    suit: "club",       color: "black"  },

        { face: "K",    suit: "spade",      color: "black"  },
        { face: "K",    suit: "heart",      color: "red"    },
        { face: "K",    suit: "diamond",    color: "red"    },
        { face: "K",    suit: "club",       color: "black"  },

        { face: "A",    suit: "spade",      color: "black"  },
        { face: "A",    suit: "heart",      color: "red"    },
        { face: "A",    suit: "diamond",    color: "red"    },
        { face: "A",    suit: "club",       color: "black"  }
    ];


function printCard(card) {
    let printStr;

    if (card.suit === "spade") {
        printStr = `${card.face}♠`;
    } else if (card.suit === "heart") {
        printStr = `${card.face}♥`;
    } else if (card.suit === "diamond") {
        printStr = `${card.face}♦`;
    } else if (card.suit === "club") {
        printStr = `${card.face}♣`;
    };

    return printStr;
}


function printDeck(deck) {
    let resultDeck = [];
    for (const card of deck) {
        resultDeck.push(printCard(card));
    }
    console.dir(resultDeck);
}

// Returns between 0 and 1
function trueRandomNumber() {
    let uint16Array = new Uint16Array(1);
    uint16Array = crypto.getRandomValues(uint16Array);
    const random16bit = uint16Array[0];
    const random = random16bit / Max16BitInt;

    // console.log(`random: ${random}, random16bit: ${random16bit}`);
    return random;
}



// Fisher-Yates shuffle
// https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle
function shuffle(array) {
    for (let i = array.length - 1; i >= 0; i--) {
        let randomNumber;
        if (DoTrueRandomShuffle) {
            randomNumber = trueRandomNumber();
        } else {
            randomNumber = Math.floor();
        }

        const j = Math.floor(randomNumber * (i + 1));
        [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
}


function draw(deck) {
    const position = deck.length - 1;
    card = deck[position];
    deck.splice(position, 1);
    return card;
}


function deal(gameState) {
    gameState.playerUpCards = [draw(deck)];
    gameState.dealerUpCards = [draw(deck)];
    gameState.playerDownCards = [draw(deck)];
    gameState.dealerDownCards = [draw(deck)];
    return gameState;
}


function test() {
    // test printDeck
    printDeck(Deck);

    // test trueRandomNumber
    console.log('Test trueRandomNumber')
    let trueRandomNumbers = [];
    for (let i = 0; i < 100; i++) {
        const result = trueRandomNumber()
        if (!((result >= 0) && (result <= 1))) {
            console.error(`bad trueRandomNumber: ${result}`)
        }
        trueRandomNumbers.push(result);
    }
    console.log(trueRandomNumbers);

    let deck = structuredClone(Deck);
    deck = shuffle(deck);
    console.log('Test deck shuffling')
    printDeck(deck);

    
    console.log('Test drawing cards')
    drawDeck = structuredClone(Deck);
    results = [];
    for (let i = 0; i < 51; i ++) { 
        const drawCard = draw(drawDeck);
        const bottomCard = printCard(drawDeck[drawDeck.length - 1]);
        // console.log(`drawn card: ${printCard(drawCard)}, bottom card: ${bottomCard}`)
        results.push(`drawn card: ${printCard(drawCard)}, bottom card: ${bottomCard}`)
    }
    console.dir(results);
    console.log('Cards left in deck:');
    console.dir(drawDeck);
}

test();