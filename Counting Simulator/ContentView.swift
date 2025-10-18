//  ContentView.swift
//  Counting Simulator
//  Started by Ivan Belov on 2021-08-02.

/* This is a beginning of a code for a file that's going to be executed. */
import SwiftUI

/* Below code expresses custom color used in the application. */
extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255 )
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
    static let lightStart = Color(red: 60 / 255, green: 160 / 255, blue: 240 / 255)
    static let lightEnd = Color(red: 30 / 255, green: 60 / 255, blue: 120 / 255)    }

extension LinearGradient    {
    init(_ Colors: Color...) {
        self.init(gradient: Gradient(colors: Colors), startPoint: .topLeading, endPoint:  .bottomTrailing)  }   }   // End of LinearGradient

/* Sets of immutable positive(red) and negative(blue) cards from 1 to 9. */
let cardP1:Image = Image("Card_Plus_1")
let cardP2:Image = Image("Card_Plus_2")
let cardP3:Image = Image("Card_Plus_3")
let cardP4:Image = Image("Card_Plus_4")
let cardP5:Image = Image("Card_Plus_5")
let cardP6:Image = Image("Card_Plus_6")
let cardP7:Image = Image("Card_Plus_7")
let cardP8:Image = Image("Card_Plus_8")
let cardP9:Image = Image("Card_Plus_9")
let cardM1:Image = Image("Card_Minus_1")
let cardM2:Image = Image("Card_Minus_2")
let cardM3:Image = Image("Card_Minus_3")
let cardM4:Image = Image("Card_Minus_4")
let cardM5:Image = Image("Card_Minus_5")
let cardM6:Image = Image("Card_Minus_6")
let cardM7:Image = Image("Card_Minus_7")
let cardM8:Image = Image("Card_Minus_8")
let cardM9:Image = Image("Card_Minus_9")

/* Cards suits for a player and an opponent. */
let cardSpot:Image = Image("cardSpot")
let opponentCardSuit:Image = Image("opponentCardsBackDesign")

/* The tuples below represent eighteen cards available for a player to form a hand. */
var tupleCardP1 = (Value:1,Image:cardP1, Path:"Card_Plus_1")
var tupleCardP2 = (Value:2,Image:cardP2, Path:"Card_Plus_2")
var tupleCardP3 = (Value:3,Image:cardP3, Path:"Card_Plus_3")
var tupleCardP4 = (Value:4,Image:cardP4, Path:"Card_Plus_4")
var tupleCardP5 = (Value:5,Image:cardP5, Path:"Card_Plus_5")
var tupleCardP6 = (Value:6,Image:cardP6, Path:"Card_Plus_6")
var tupleCardP7 = (Value:7,Image:cardP7, Path:"Card_Plus_7")
var tupleCardP8 = (Value:8,Image:cardP8, Path:"Card_Plus_8")
var tupleCardP9 = (Value:9,Image:cardP9, Path:"Card_Plus_9")
var tupleCardM1 = (Value:-1,Image:cardM1, Path:"Card_Minus_1")
var tupleCardM2 = (Value:-2,Image:cardM2, Path:"Card_Minus_2")
var tupleCardM3 = (Value:-3,Image:cardM3, Path:"Card_Minus_3")
var tupleCardM4 = (Value:-4,Image:cardM4, Path:"Card_Minus_4")
var tupleCardM5 = (Value:-5,Image:cardM5, Path:"Card_Minus_5")
var tupleCardM6 = (Value:-6,Image:cardM6, Path:"Card_Minus_6")
var tupleCardM7 = (Value:-4,Image:cardM4, Path:"Card_Minus_7")
var tupleCardM8 = (Value:-5,Image:cardM5, Path:"Card_Minus_8")
var tupleCardM9 = (Value:-6,Image:cardM6, Path:"Card_Minus_9")

/* Dealer cards are used only once per match(turn). */
var dealerCardPOne = (Taken:false,Image:cardP1, Value: 1)
var dealerCardPTwo = (Taken:false,Image:cardP2, Value: 2)
var dealerCardPThree = (Taken:false,Image:cardP3, Value: 3)
var dealerCardPFour = (Taken:false,Image:cardP4, Value: 4)
var dealerCardPFive = (Taken:false,Image:cardP5, Value: 5)
var dealerCardPSix = (Taken:false,Image:cardP6, Value: 6)
var dealerCardPSeven = (Taken:false,Image:cardP7, Value: 7)
var dealerCardPEight = (Taken:false,Image:cardP8, Value: 8)
var dealerCardPNine = (Taken:false,Image:cardP9, Value: 9)

/* A set of nine cards representing dealer's cards to be dealt during each round */
var dealerCards = [dealerCardPOne,dealerCardPTwo,dealerCardPThree,dealerCardPFour,dealerCardPFive,dealerCardPSix,dealerCardPSeven,dealerCardPEight,dealerCardPNine]

/* These eighteen images represent a gameboard of eighteen cells(spots). */
let p1:Image = Image("cardSpot")
let p2:Image = Image("cardSpot")
let p3:Image = Image("cardSpot")
let p4:Image = Image("cardSpot")
let p5:Image = Image("cardSpot")
let p6:Image = Image("cardSpot")
let p7:Image = Image("cardSpot")
let p8:Image = Image("cardSpot")
let p9:Image = Image("cardSpot")
let o1:Image = Image("cardSpot")
let o2:Image = Image("cardSpot")
let o3:Image = Image("cardSpot")
let o4:Image = Image("cardSpot")
let o5:Image = Image("cardSpot")
let o6:Image = Image("cardSpot")
let o7:Image = Image("cardSpot")
let o8:Image = Image("cardSpot")
let o9:Image = Image("cardSpot")

/* These eighteen tuples represent a gameboard of eighteen cells(spots). */
var tupleP1 = (Taken:false,Image:p1)
var tupleP2 = (Taken:false,Image:p2)
var tupleP3 = (Taken:false,Image:p3)
var tupleP4 = (Taken:false,Image:p4)
var tupleP5 = (Taken:false,Image:p5)
var tupleP6 = (Taken:false,Image:p6)
var tupleP7 = (Taken:false,Image:p7)
var tupleP8 = (Taken:false,Image:p8)
var tupleP9 = (Taken:false,Image:p9)
var tupleO1 = (Taken:false,Image:o1)
var tupleO2 = (Taken:false,Image:o2)
var tupleO3 = (Taken:false,Image:o3)
var tupleO4 = (Taken:false,Image:o4)
var tupleO5 = (Taken:false,Image:o5)
var tupleO6 = (Taken:false,Image:o6)
var tupleO7 = (Taken:false,Image:o7)
var tupleO8 = (Taken:false,Image:o8)
var tupleO9 = (Taken:false,Image:o9)

/* Below arrays facilitate hands for both players. */
let interImage:Image = Image("")

var tuplePlayerHandOne = (Taken:false, Image: interImage, Value: 0, Path:"")
var tuplePlayerHandTwo = (Taken:false, Image: interImage, Value: 0, Path:"")
var tuplePlayerHandThree = (Taken:false, Image: interImage, Value: 0, Path:"")
var tuplePlayerHandFour = (Taken:false, Image: interImage, Value: 0, Path:"")
var tupleOpponentHandOne = (Taken:false, Image: interImage, Value: 0, Path:"")
var tupleOpponentHandTwo = (Taken:false, Image: interImage, Value: 0, Path:"")
var tupleOpponentHandThree = (Taken:false, Image: interImage, Value: 0, Path:"")
var tupleOpponentHandFour = (Taken:false, Image: interImage, Value: 0, Path:"")

/* A set of eighteen cards representing a deck for a player. */
var deck = [tupleCardP1,tupleCardP2,tupleCardP3,tupleCardP4,tupleCardP5,tupleCardP6,tupleCardP7,tupleCardP8,tupleCardP9,tupleCardM1,tupleCardM2,tupleCardM3,tupleCardM4,tupleCardM5,tupleCardM6,tupleCardM7,tupleCardM8,tupleCardM9]

/* Keeping track of opponent and player gameboards. */
var playerGameboard = [tupleP1,tupleP2,tupleP3,tupleP4,tupleP5,tupleP6,tupleP7,tupleP8,tupleP9]

var opponentGameboard = [tupleO1,tupleO2,tupleO3,tupleO4,tupleO5,tupleO6,tupleO7,tupleO8,tupleO9]

/* Ten card deck for a player. Four cards used as a hand. */
var playersHand:[Int] = []
var playerPlayingHand:[Int] = []
var playerHand = [tuplePlayerHandOne,tuplePlayerHandTwo,tuplePlayerHandThree,tuplePlayerHandFour]

var opponentsHand:[Int] = []
var opponentPlayingHand:[Int] = []
var opponentHand = [tupleOpponentHandOne,tupleOpponentHandTwo,tupleOpponentHandThree,tupleOpponentHandFour]

var positionPlayerHand:[Int] = []
var positionPlayerPlayingHand:[Int] = []
var positionOpponentHand:[Int] = []
var positionOpponentPlayingHand:[Int] = []

var interCard = 0;

/* Various logic switches. */
var opponentFirstHandCardSwitch = false;
var opponentSecondHandCardSwitch = false;
var opponentThirdHandCardSwitch = false;
var opponentFourthHandCardSwitch = false;
var playerFirstHandCardSwitch = false;
var playerSecondHandCardSwitch = false;
var playerThirdHandCardSwitch = false;
var playerFourthHandCardSwitch = false;

var booleanTurn = false;
var booleanGame = true;

var turnCount = 0;

/* Main method */
struct ContentView: View {
    
    @State private var playerColorOne: Color = .gray
    @State private var playerColorTwo: Color = .gray
    @State private var playerColorThree: Color = .gray
    
    @State private var opponentColorOne: Color = .gray
    @State private var opponentColorTwo: Color = .gray
    @State private var opponentColorThree: Color = .gray

    struct myMenuStyle: MenuStyle {
        func makeBody(configuration: Configuration) -> some View {
            Menu(configuration) .foregroundColor(.pink) }   }

    /* These are Game Play buttons ( New Game, Hit, Stand ) */
    struct SimpleButton: ButtonStyle    {
        func makeBody(configuration: Self.Configuration) -> some View   {
            configuration.label
                .padding(50)
                .contentShape(Capsule())
                .background(    Group   {
                    if configuration.isPressed  {   Capsule()
                        .fill(Color.offWhite)
                        .overlay(   Capsule()
                        .stroke(Color.gray, lineWidth: 4)
                        .blur(radius: 4)
                        .offset(x: 2, y: 2)
                        .mask(Capsule().fill(LinearGradient(Color.black, Color.clear))) ) .overlay(   Capsule()
                        .stroke(Color.white, lineWidth: 8)
                        .blur(radius: 4)
                        .offset(x: -2, y: -2)
                        .mask(Capsule().fill(LinearGradient(Color.clear, Color.black))) )   }   else    {   Capsule()
                        .fill(Color.offWhite)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)  }   })  }   }

    /* Stylizing a button. */
    struct BlueButton: ButtonStyle  {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .foregroundColor(Color.black)
                .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.blue]), startPoint: .leading, endPoint: .trailing) )
                .font(.largeTitle)
                .cornerRadius(35)           // option to finetune clipShape
                .scaleEffect(1.2)
                .blendMode(/*@START_MENU_TOKEN@*/.hardLight/*@END_MENU_TOKEN@*/)
                .scaleEffect(configuration.isPressed ? 1.2 : 1) // first step in press action
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed) }   }

    /* Stylizing a first round's progress button. */
    struct RoundButtonPlayerOne: ButtonStyle  {
        var outcomeColor = Color.gray
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [outcomeColor , Color.black]), startPoint: .leading, endPoint: .trailing)  )
                .clipShape(Circle())       // the shape of a button
                .scaleEffect(2)             // magnification of the button
                .padding(.horizontal, 15)   }   }

    /* The middle light indicating the player's progress. */
    struct RoundButtonPlayerTwo: ButtonStyle  {
        var outcomeColor = Color.gray
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [outcomeColor , Color.black]), startPoint: .leading, endPoint: .trailing))
                .clipShape(Circle())                // The shape of a button.
                .scaleEffect(2)                     // Magnification of the button.
                .padding(.horizontal, 15)   }   }   // End of struct BlueButton.

    /* The last light indicating player's progress. */
    struct RoundButtonPlayerThree: ButtonStyle  {
        var outcomeColor = Color.gray
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [outcomeColor , Color.black]), startPoint: .leading, endPoint: .trailing))
                .clipShape(Circle())                // The shape of a button.
                .scaleEffect(2)                     // Magnification of the button
                .padding(.horizontal, 15)   }   }   // End of struct BlueButton.

    /* Stylizing a first round's progress button for opponent. */
    struct RoundButtonOpponentOne: ButtonStyle  {
        var outcomeColor = Color.gray
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [outcomeColor , Color.black]), startPoint: .leading, endPoint: .trailing)  )
                .clipShape(Circle())       // the shape of a button
                .scaleEffect(2)             // magnification of the button
                .padding(.horizontal, 15)   }   }
    
    /* Stylizing a second round's progress button for opponent. */
    struct RoundButtonOpponentTwo: ButtonStyle  {
        var outcomeColor = Color.gray
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [outcomeColor , Color.black]), startPoint: .leading, endPoint: .trailing)  )
                .clipShape(Circle())       // the shape of a button
                .scaleEffect(2)             // magnification of the button
                .padding(.horizontal, 15)   }   }
    
    /* Stylizing a third round's progress button for opponent. */
    struct RoundButtonOpponentThree: ButtonStyle  {
        var outcomeColor = Color.gray
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [outcomeColor , Color.black]), startPoint: .leading, endPoint: .trailing)  )
                .clipShape(Circle())       // the shape of a button
                .scaleEffect(2)             // magnification of the button
                .padding(.horizontal, 15)   }   }
    
    /* Stylizing for a gameboard spot. */
    struct GameboardButton: ButtonStyle  {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .foregroundColor(.white)
                .background(cardSpot)
                .scaleEffect(1.1)          // Magnification of the button.
                .cornerRadius(5)           // Slightly Rounded corners
                .padding()  }   }           // End of struct GameboardButton.

    /* Stylizing for a pressed button. */
    struct GrowingButton: ButtonStyle   {
        func makeBody(configuration: Configuration) -> some View    {
            configuration.label
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .scaleEffect(configuration.isPressed ? 1.1 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed) }   }

    /* Stylizing for a score. */
    struct CurrentScoreButton: ButtonStyle   {
        func makeBody(configuration: Configuration) -> some View    {
            configuration.label
                .font(.system(size: 55))
                .font(.system(.headline, design: .rounded))
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.darkEnd]), startPoint: .leading, endPoint: .trailing)/*Color(red: 0, green: 0, blue: 0.5)*/)
                .blendMode(/*@START_MENU_TOKEN@*/.hardLight/*@END_MENU_TOKEN@*/)
                .clipShape(RoundedRectangle(cornerRadius: 35))
                .padding()
                .foregroundColor(/*@START_MENU_TOKEN@*/.pink/*@END_MENU_TOKEN@*/)}   }   // End of CurrentScoreButton

    // Card's style
    struct PlayerHandButton: ButtonStyle  {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? 1 : 0.95)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
                .foregroundColor(.white)
                .cornerRadius(3)
                .padding(.horizontal, 30)    // Padding on right and left.
                .padding(.vertical,35)}   }  // End of struct GameboardButton.

    /* Stylizing for an opponenets's card. */
    struct OpponentHandButton: ButtonStyle  {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? 1 : 0.95)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
                .foregroundColor(.white)
                .cornerRadius(3)
                .padding(.horizontal, 30)       // Padding on right and left.
                .padding(.vertical,35)  }   }   // End of struct GameboardButton.

    struct DarkBackground<S: Shape>: View   {
        var isHighlighted: Bool
        var shape: S
        var body: some View {
            ZStack  {   if isHighlighted    {   shape
                .fill(LinearGradient(Color.darkEnd, Color.darkStart))
                .overlay(shape.stroke(LinearGradient(Color.darkStart, Color.darkEnd), lineWidth: 4))
                .shadow(color: Color.darkStart, radius: 10, x:5, y:5)
                .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
                }   else    {   shape
                .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                .overlay(shape.stroke(Color.darkEnd, lineWidth: 4))
                .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10) }   }   }   }

    struct LightBackground<S: Shape>: View   {
        var isHighlighted: Bool
        var shape: S
        var body: some View {
            ZStack  {   if isHighlighted    {   shape
                .fill(LinearGradient(Color.lightEnd, Color.lightStart))
                .overlay(shape.stroke(LinearGradient(Color.lightStart, Color.lightEnd), lineWidth: 4))
                .shadow(color: Color.darkStart, radius: 10, x:5, y:5)
                .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
                }   else    {   shape
                .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                .overlay(shape.stroke(LinearGradient(Color.lightStart, Color.lightEnd), lineWidth: 4))
                .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10) }   }   }   }

    struct LightToggleStyle: ToggleStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
            Button(action:  {   configuration.isOn.toggle() })  {
                                configuration.label
                .padding(30)
                .contentShape(Capsule())    }   .background(
    LightBackground(isHighlighted: configuration.isOn, shape: Capsule())    )   }   }

    struct LightButtonStyle: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View{
            configuration.label
            .padding(60)
            .contentShape(Capsule()/*Circle()*/)
            .frame(width: 350, height: 100)
            .background(
                LightBackground(isHighlighted: configuration.isPressed, shape: Capsule())
            )   .animation(nil) }   }   // End of DarkButtonStyle

    struct DarkToggleStyle: ToggleStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
            Button(action:  {
                configuration.isOn.toggle() })  {
                configuration.label
                    .padding(30)
                    .contentShape(Capsule())    }
            .background(
    DarkBackground(isHighlighted: configuration.isOn, shape: Capsule()) )   }   }

    struct DarkButtonStyle: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View{
            configuration.label
                .padding(50)
                .contentShape(Capsule())
                .frame(width: 270, height: 100)
                .background(
    DarkBackground(isHighlighted: configuration.isPressed, shape: Capsule())
            )   .animation(nil) }   }   // End of DarkButtonStyle
    
    @State private var isToggled = false
    
    @State private var targetScore = 21
    
    @State private var gameOn = true
    @State private var roundsCount = 0
    @State private var playerScore: Int = 0
    @State private var opponentScore: Int = 0
    
    @State private var playerFirstInterValue: Int = 0
    @State private var playerSecondInterValue: Int = 0
    @State private var playerThirdInterValue: Int = 0
    @State private var playerFourthInterValue: Int = 0
    @State private var opponentFirstInterValue: Int = 0
    @State private var opponentSecondInterValue: Int = 0
    @State private var opponentThirdInterValue: Int = 0
    @State private var opponentFourthInterValue: Int = 0
    
    @State private var playerFirstCardFace: Image = cardSpot
    @State private var playerSecondCardFace: Image = cardSpot
    @State private var playerThirdCardFace: Image = cardSpot
    @State private var playerFourthCardFace: Image = cardSpot
    @State private var opponentFirstCardFace: Image = cardSpot
    @State private var opponentSecondCardFace: Image = cardSpot
    @State private var opponentThirdCardFace: Image = cardSpot
    @State private var opponentFourthCardFace: Image = cardSpot
    
    @State private var playerFirstInterCard: Image = cardSpot
    @State private var playerSecondInterCard: Image = cardSpot
    @State private var playerThirdInterCard: Image = cardSpot
    @State private var playerFourthInterCard: Image = cardSpot
    @State private var opponentFirstInterCard: Image = cardSpot
    @State private var opponentSecondInterCard: Image = cardSpot
    @State private var opponentThirdInterCard: Image = cardSpot
    @State private var opponentFourthInterCard: Image = cardSpot
    
    /* (p)layer and (o)pponent numbered variables represent player and opponent board tiles. */
    @State private var p1: Image = cardSpot
    @State private var p2: Image = cardSpot
    @State private var p3: Image = cardSpot
    @State private var p4: Image = cardSpot
    @State private var p5: Image = cardSpot
    @State private var p6: Image = cardSpot
    @State private var p7: Image = cardSpot
    @State private var p8: Image = cardSpot
    @State private var p9: Image = cardSpot
    @State private var o1: Image = cardSpot
    @State private var o4: Image = cardSpot
    @State private var o7: Image = cardSpot
    @State private var o2: Image = cardSpot
    @State private var o5: Image = cardSpot
    @State private var o8: Image = cardSpot
    @State private var o3: Image = cardSpot
    @State private var o6: Image = cardSpot
    @State private var o9: Image = cardSpot
    
    /* Scanning for a win condition */
    func checkGameStatus() {
        if playerScore == targetScore {
            print("you win a round")
            playerColorOne = .green
            opponentColorOne = .red
            return  }
        
        if opponentScore == targetScore {
            print("opponent wins a round")
            opponentColorOne = .green
            playerColorOne = .red
            return  }
        
        if playerScore > targetScore {
            print("you lost a round")
            playerColorOne = .red
            opponentColorOne = .green
            return  }
        
        if opponentScore > targetScore {
            print("opponent lost a round")
            playerColorOne = .green
            opponentColorOne = .red
            return  }   }   // End of checkGameStatus
    
    /* Placing a selected card from a hand onto a gameboard. */
    func selectPlayerFirstCard()   {
        while (playerFirstHandCardSwitch == false)    {
            for position in 0...playerGameboard.count  {
                if (playerGameboard[position].Taken == false)   {
                    playerGameboard[position].Image = playerFirstInterCard
                    playerGameboard[position].Taken = true
                    playerFirstCardFace = cardSpot
                    self.playerScore += playerFirstInterValue
                    playerFirstInterValue = 0
                    playerFirstInterCard = cardSpot
                    playerFirstHandCardSwitch = true
                    booleanTurn = false
                    break   }   }   }
        checkGameStatus()
    }
    
    func selectPlayerSecondCard()   {
        while (playerSecondHandCardSwitch == false)    {
            for position in 0...playerGameboard.count  {
                if (playerGameboard[position].Taken == false)   {
                    playerGameboard[position].Image = playerSecondInterCard
                    playerGameboard[position].Taken = true
                    playerSecondCardFace = cardSpot
                    self.playerScore += playerSecondInterValue
                    playerSecondInterValue = 0
                    playerSecondInterCard = cardSpot
                    playerSecondHandCardSwitch = true
                    booleanTurn = false
                    break   }   }   }
        checkGameStatus()
    }
    
    func selectPlayerThirdCard()   {
        while (playerThirdHandCardSwitch == false)    {
            for position in 0...playerGameboard.count  {
                if (playerGameboard[position].Taken == false)   {
                    playerGameboard[position].Image = playerThirdInterCard
                    playerGameboard[position].Taken = true
                    playerThirdCardFace = cardSpot
                    self.playerScore += playerThirdInterValue
                    playerThirdInterValue = 0
                    playerThirdInterCard = cardSpot
                    playerThirdHandCardSwitch = true
                    booleanTurn = false
                    break   }   }   }
        checkGameStatus()
    }
    
    func selectPlayerFourthCard()   {
        while (playerFourthHandCardSwitch == false)    {
            for position in 0...playerGameboard.count  {
                if (playerGameboard[position].Taken == false)   {
                    playerGameboard[position].Image = playerFourthInterCard
                    playerGameboard[position].Taken = true
                    playerFourthCardFace = cardSpot
                    self.playerScore += playerFourthInterValue
                    playerFourthInterValue = 0
                    playerFourthInterCard = cardSpot
                    playerFourthHandCardSwitch = true
                    booleanTurn = false
                    break   }   }   }
        checkGameStatus()
    }
    
    func selectOpponentFirstCard()   {
        while (opponentFirstHandCardSwitch == false)    {
            for position in 0...opponentGameboard.count  {
                if (opponentGameboard[position].Taken == false)   {
                    opponentGameboard[position].Image = opponentFirstInterCard
                    opponentGameboard[position].Taken = true
                    opponentFirstCardFace = cardSpot
                    self.opponentScore += opponentFirstInterValue
                    opponentFirstInterValue = 0
                    opponentFirstInterCard = cardSpot
                    opponentFirstHandCardSwitch = true
                    break   }   }   }
        checkGameStatus()
    }
    
    func selectOpponentSecondCard()   {
        while (opponentSecondHandCardSwitch == false)   {
            for position in 0...opponentGameboard.count  {
                if (opponentGameboard[position].Taken == false)   {
                    opponentGameboard[position].Image = opponentSecondInterCard
                    opponentGameboard[position].Taken = true
                    opponentSecondCardFace = cardSpot
                    self.opponentScore += opponentSecondInterValue
                    opponentSecondInterValue = 0
                    opponentSecondInterCard = cardSpot
                    opponentSecondHandCardSwitch = true
                    break   }   }   }
        checkGameStatus()
    }
    
    func selectOpponentThirdCard()   {
        while (opponentThirdHandCardSwitch == false)    {
            for position in 0...opponentGameboard.count  {
                if (opponentGameboard[position].Taken == false)   {
                    opponentGameboard[position].Image = opponentThirdInterCard
                    opponentGameboard[position].Taken = true
                    opponentThirdCardFace = cardSpot
                    self.opponentScore += opponentThirdInterValue
                    opponentThirdInterValue = 0
                    opponentThirdInterCard = cardSpot
                    opponentThirdHandCardSwitch = true
                    break   }   }   }
        checkGameStatus()
    }
    
    func selectOpponentFourthCard()   {
        while (opponentFourthHandCardSwitch == false)    {
            for position in 0...opponentGameboard.count  {
                if (opponentGameboard[position].Taken == false)   {
                    opponentGameboard[position].Image = opponentFourthInterCard
                    opponentGameboard[position].Taken = true
                    opponentFourthCardFace = cardSpot
                    self.opponentScore += opponentFourthInterValue
                    opponentFourthInterValue = 0
                    opponentFourthInterCard = cardSpot
                    opponentFourthHandCardSwitch = true
                    break   }   }   }
        checkGameStatus()
    }
    
    /* Setting up decks, hands for a new game of three rounds. */
    func newGame()  {
        // Resetting state pertinent to a game and not a round
        gameOn = true
        roundsCount = 0
        
        // Reset progress indicators
        playerColorOne = .gray
        playerColorTwo = .gray
        playerColorThree = .gray
        opponentColorOne = .gray
        opponentColorTwo = .gray
        opponentColorThree = .gray
        
        resetGameBoardForGameOrRound()
        
        // Initialize Player's and Opponent's Decks and hands
        initializePlayerDeckAndHand()
        initializeOpponentDeckAndHand()
        
        print(" ")
        print("Player Values: ")
        print(playerPlayingHand)
        print(" ")
        print("Opponent Values: ")
        print(opponentPlayingHand)
        
        // Set up initial cards values and faces
        setUpInitialCardStates()
        
        // Game is now ready - first turn will be triggered by user action
        print("New game started - ready for first turn")
    }   // End of newGame()
    
    func resetGameBoardForGameOrRound() {
        
        // Clear hands and positions
        playersHand.removeAll()
        playerPlayingHand.removeAll()
        opponentsHand.removeAll()
        opponentPlayingHand.removeAll()
        positionPlayerHand.removeAll()
        positionPlayerPlayingHand.removeAll()
        positionOpponentHand.removeAll()
        positionOpponentPlayingHand.removeAll()
        
        // Reset gameboard images
        p1 = cardSpot
        p2 = cardSpot
        p3 = cardSpot
        p4 = cardSpot
        p5 = cardSpot
        p6 = cardSpot
        p7 = cardSpot
        p8 = cardSpot
        p9 = cardSpot
        o1 = cardSpot
        o4 = cardSpot
        o7 = cardSpot
        o2 = cardSpot
        o5 = cardSpot
        o8 = cardSpot
        o3 = cardSpot
        o6 = cardSpot
        o9 = cardSpot
        
        // Reset tuples
        tupleP1 = (false,cardSpot)
        tupleP2 = (false,cardSpot)
        tupleO1 = (false,cardSpot)
        tupleO2 = (false,cardSpot)
        
        // Reset game state
        playerScore = 0
        opponentScore = 0
        
        // Reset switches
        opponentFourthHandCardSwitch = false
        opponentThirdHandCardSwitch = false
        opponentSecondHandCardSwitch = false
        opponentFirstHandCardSwitch = false
        playerFourthHandCardSwitch = false
        playerThirdHandCardSwitch = false
        playerSecondHandCardSwitch = false
        playerFirstHandCardSwitch = false
        
        // Reset inter values
        playerFirstInterValue = 0
        playerSecondInterValue = 0
        playerThirdInterValue = 0
        playerFourthInterValue = 0
        opponentFirstInterValue = 0
        opponentSecondInterValue = 0
        opponentThirdInterValue = 0
        opponentFourthInterValue = 0
        
        // Reset card faces
        playerFirstCardFace = cardSpot
        playerSecondCardFace = cardSpot
        playerThirdCardFace = cardSpot
        playerFourthCardFace = cardSpot
        opponentFirstCardFace = cardSpot
        opponentSecondCardFace = cardSpot
        opponentThirdCardFace = cardSpot
        opponentFourthCardFace = cardSpot
        
        // Reset inter cards
        playerFirstInterCard = cardSpot
        playerSecondInterCard = cardSpot
        playerThirdInterCard = cardSpot
        playerFourthInterCard = cardSpot
        opponentFirstInterCard = cardSpot
        opponentSecondInterCard = cardSpot
        opponentThirdInterCard = cardSpot
        opponentFourthInterCard = cardSpot
        
        // Reset game board
        for position in 0...playerGameboard.count - 1 {
            playerGameboard[position].Taken = false
            playerGameboard[position].Image = cardSpot
            opponentGameboard[position].Taken = false
            opponentGameboard[position].Image = cardSpot    }
        
        // Reset Dealer's deck
        for everyCard in 0...dealerCards.count - 1 {
            dealerCards[everyCard].Taken = false    }
    }
    
    func setUpInitialCardStates() {
        playerFirstInterValue = deck[positionPlayerPlayingHand[0]].Value
        playerSecondInterValue = deck[positionPlayerPlayingHand[1]].Value
        playerThirdInterValue = deck[positionPlayerPlayingHand[2]].Value
        playerFourthInterValue = deck[positionPlayerPlayingHand[3]].Value
        opponentFirstInterValue = deck[positionOpponentPlayingHand[0]].Value
        opponentSecondInterValue = deck[positionOpponentPlayingHand[1]].Value
        opponentThirdInterValue = deck[positionOpponentPlayingHand[2]].Value
        opponentFourthInterValue = deck[positionOpponentPlayingHand[3]].Value
        
        playerFirstCardFace = deck[positionPlayerPlayingHand[0]].Image
        playerSecondCardFace = deck[positionPlayerPlayingHand[1]].Image
        playerThirdCardFace = deck[positionPlayerPlayingHand[2]].Image
        playerFourthCardFace = deck[positionPlayerPlayingHand[3]].Image
        opponentFirstCardFace = opponentCardSuit
        opponentSecondCardFace = opponentCardSuit
        opponentThirdCardFace = opponentCardSuit
        opponentFourthCardFace = opponentCardSuit
        
        opponentFirstInterCard = deck[positionOpponentPlayingHand[0]].Image
        opponentSecondInterCard = deck[positionOpponentPlayingHand[1]].Image
        opponentThirdInterCard = deck[positionOpponentPlayingHand[2]].Image
        opponentFourthInterCard = deck[positionOpponentPlayingHand[3]].Image
        playerFirstInterCard = deck[positionPlayerPlayingHand[0]].Image
        playerSecondInterCard = deck[positionPlayerPlayingHand[1]].Image
        playerThirdInterCard = deck[positionPlayerPlayingHand[2]].Image
        playerFourthInterCard = deck[positionPlayerPlayingHand[3]].Image
    }
    
        func initializePlayerDeckAndHand() {
            /* Creating arrays of ten deck cards and four hand cards for a player. */
            for _ in 1...10  {
                interCard = Int.random(in: 0..<deck.count)
                repeat  {
                    while (playersHand.contains(deck[interCard].Value))    {
                    print("duplicate")
                    interCard = Int.random(in: 0..<deck.count)  }
                    playersHand.append(deck[interCard].Value)
                    positionPlayerHand.append(interCard)
                    interCard = Int.random(in: 0..<deck.count)
                }   while !playersHand.contains(deck[interCard].Value) && playersHand.capacity == 9 }
            for _ in 1...4  {
                interCard = Int.random(in: 0..<playersHand.count)
                repeat  {
                    while (playerPlayingHand.contains(deck[interCard].Value))    {
                    print("duplicate")
                    interCard = Int.random(in: 0..<playersHand.count)   }
                    print(interCard)
                    playerPlayingHand.append(deck[interCard].Value)
                    positionPlayerPlayingHand.append(interCard)
                    interCard = Int.random(in: 0..<playersHand.count)
                }   while !playerPlayingHand.contains(playersHand[interCard]) && playerPlayingHand.capacity == 3 } }
        
        func initializeOpponentDeckAndHand() {
            for _ in 1...10 {
                interCard = Int.random(in: 0..<deck.count)
                repeat  {
                    while (opponentsHand.contains(deck[interCard].Value))    {
                    print("duplicate")
                    interCard = Int.random(in: 0..<deck.count)  }
                    opponentsHand.append(deck[interCard].Value)
                    positionOpponentHand.append(interCard)
                    interCard = Int.random(in: 0..<deck.count)
                }   while !opponentsHand.contains(deck[interCard].Value) && opponentsHand.capacity == 9 }
            for _ in 1...4  {
                interCard = Int.random(in: 0..<opponentsHand.count)
                repeat  {
                    while (opponentPlayingHand.contains(deck[interCard].Value))    {
                    print("duplicate")
                    interCard = Int.random(in: 0..<opponentsHand.count) }
                    print(interCard)
                    opponentPlayingHand.append(deck[interCard].Value)
                    positionOpponentPlayingHand.append(interCard)
                    interCard = Int.random(in: 0..<opponentsHand.count)
            }   while !opponentPlayingHand.contains(opponentsHand[interCard]) && opponentPlayingHand.capacity == 3  } }
                
                    // Setting up gameboard and hands for new round
                    func newRound()  {
                        
                        resetGameBoardForGameOrRound()
                        
                        // Initialize Player's and Opponent's Decks and hands
                        initializePlayerDeckAndHand()
                        initializeOpponentDeckAndHand()
                        
                        print(" ")
                        print("Player Values: ")
                        print(playerPlayingHand)
                        print(" ")
                        print("Opponent Values: ")
                        print(opponentPlayingHand)
                        
                        setUpInitialCardStates()
                        
                    }   // End of newRound()
        
    /* Deals a card to both players from the dealer deck. */
                func dealerMove() {
                    
                    checkGameStatus()
                    
                    for position in 0...opponentGameboard.count - 1 {
                        var randomCardNum = Int.random(in: 0..<dealerCards.count - 1)
                        if (opponentGameboard[position].Taken == false)   {
                            if (dealerCards[randomCardNum].Taken == false)   {
                                let randomCard = dealerCards[randomCardNum].Image
                                opponentGameboard[position].Image = randomCard
                                opponentGameboard[position].Taken = true
                                dealerCards[randomCardNum].Taken = true
                                self.opponentScore += dealerCards[randomCardNum].Value
                                break   }   else {  repeat  {
                                    randomCardNum = Int.random(in: 0..<dealerCards.count - 1)   }
                                    while dealerCards[randomCardNum].Taken != false
                                            let randomCard = dealerCards[randomCardNum].Image
                                            opponentGameboard[position].Image = randomCard
                                            opponentGameboard[position].Taken = true
                                            dealerCards[randomCardNum].Taken = true
                                            self.opponentScore += dealerCards[randomCardNum].Value
                                            break   }   }   }   /* End of Player Card */
                    
                    for positionPlayer in 0...playerGameboard.count - 1  {
                        var randomCardNum = Int.random(in: 0..<dealerCards.count - 1)
                        if (playerGameboard[positionPlayer].Taken == false)   {
                            if (dealerCards[randomCardNum].Taken == false)   {
                                let randomCard = dealerCards[randomCardNum].Image
                                playerGameboard[positionPlayer].Image = randomCard
                                playerGameboard[positionPlayer].Taken = true
                                dealerCards[randomCardNum].Taken = true
                                self.playerScore += dealerCards[randomCardNum].Value
                                break   }   else {  repeat  {
                                    randomCardNum = Int.random(in: 0..<dealerCards.count - 1)   }
                                    while dealerCards[randomCardNum].Taken != false
                                            let randomCard = dealerCards[randomCardNum].Image
                                            playerGameboard[positionPlayer].Image = randomCard
                                            playerGameboard[positionPlayer].Taken = true
                                            dealerCards[randomCardNum].Taken = true
                                            self.playerScore += dealerCards[randomCardNum].Value
                                            break   }   }   }
                    checkGameStatus()
                }   // End of dealerMove()
    
                func opponentMove() {
                    let interScore = playerScore
                    // for every cell on the playboard.
                    for position in 0...opponentGameboard.count  {
                        // if one of those is not taken.
                        if (opponentGameboard[position].Taken == false)   {
                            // choose one card out of a hand of four cards.
                            let randomCardNum = Int.random(in: 0..<opponentHand.count)
                            // if a card was not yet played
                            if (opponentHand[randomCardNum].Taken == false)   {
                                switch randomCardNum    {
                                case 0  :   selectOpponentFirstCard()
                                case 1  :   selectOpponentSecondCard()
                                case 2  :   selectOpponentThirdCard()
                                case 3  :   selectOpponentFourthCard()
                                    default :   hitOpponent()   }
                                break   }   }   }
                    if(interScore != playerScore)   {
                        if (playerScore == targetScore)  { print("opponent won") }
                        else if (playerScore >= targetScore) { print("opponent lost") }
                        else { oneTurn() } }
                    checkGameStatus()
                    }   // End of opponentMove()
    
            // Player's move.
            func playerMove()   {
                let interScore = playerScore
                while ( interScore == playerScore ) {
                    if (interScore > playerScore || interScore < playerScore)  {
                        break; } // End of if statement
                } // End of While loop
            } // End of player's move
    
                func startGame()    {
                    newGame();
                    repeat  {   oneTurn()
                    }   while (booleanTurn == false && booleanGame == true) }
                    
                    func oneTurn()   {
                        booleanTurn = true
                        dealerMove()
                        opponentMove()
                        checkGameStatus()
                        print("End of turn")
                        print("turn : " , turnCount)
                    }  // End of oneTurn
                    
                    // Skipping or Standing a move
                    func stand()    {
                        dealerMove()
                        opponentMove()
                        print("standing")   }   // End of stand()
                    
                    // Opponent's move.
                    func hitOpponent()  {
                        for position in 0...opponentGameboard.count  {
                            if (opponentGameboard[position].Taken == false)   {
                                let randomCardNum = Int.random(in: 0..<dealerCards.count)
                                if (dealerCards[randomCardNum].Taken == false)   {
                                    let randomCard = dealerCards[randomCardNum].Image
                                    opponentGameboard[position].Image = randomCard
                                    opponentGameboard[position].Taken = true
                                    dealerCards[randomCardNum].Taken = true
                                    self.opponentScore += dealerCards[randomCardNum].Value
                                    break   }   }   }   }   // End of hit()
                    
                    var body: some View {
                        
                        ZStack  { // The Main Main Stack
                            Color.offWhite
                            LinearGradient(Color.darkStart, Color.darkEnd)
                            VStack() {    // Main VStack
                                HStack()    {
                                    Spacer()
                                    Button(action:  startGame)  {
                                        HStack()    {
                                            Image(systemName: "arrowtriangle.right.circle.fill")
                                                .renderingMode(.template)
                                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                                .foregroundColor(Color.offWhite)
                                                .padding(10.0)
                                                .frame(width: 0.0)
                                            Spacer()
                                            Text("NEW GAME")
                                                .foregroundColor(Color.offWhite)
                                                .font(.largeTitle)
                                                .blendMode(/*@START_MENU_TOKEN@*/.hardLight/*@END_MENU_TOKEN@*/)
                                                .padding(.vertical, 10)
                                            .padding(.horizontal, 10) }   }
                                    .padding(.vertical, 40.0)
                                    .buttonStyle(LightButtonStyle())
                                    .font(.largeTitle)
                                    Spacer() }   // End of HStack
                                Spacer()
                                
                                HStack()  {   //  Players Scores Area
                                    HStack  {   // Player Score ( from right to left )
                                        Button("")   {  }
                                            .buttonStyle(RoundButtonPlayerOne(outcomeColor: playerColorOne))
                                        Button("")   {  }
                                            .buttonStyle(RoundButtonPlayerTwo())
                                        Button("")   {  }
                                            .buttonStyle(RoundButtonPlayerThree())
                                    }   // End of Player Score
                                    Spacer()
                                    HStack()  {   // Opponent Score ( from right to left )
                                        Button("")   {  }
                                            .buttonStyle(RoundButtonOpponentThree())
                                        Button("")   {  }
                                            .buttonStyle(RoundButtonOpponentTwo())
                                        Button("")   {  }
                                            .buttonStyle(RoundButtonOpponentOne(outcomeColor: opponentColorOne))
                                    }   // End of Opponent Score
                                }   // Player and Opponent Score Area
                                .padding(.all, 30.0)   // End of Players Scores
                                
                                HStack()    {   // Match Scores spaced out apart
                                    Button("\(playerScore)")    {   };
                                    Button("\(opponentScore)")  {   }   }
                                .padding(.horizontal)
                                .buttonStyle(CurrentScoreButton())
                                HStack()  {   // Player Area
                                    VStack  {   // Player
                                        Button(action: { selectPlayerFirstCard() }, label: { playerFirstCardFace} )
                                            .scaleEffect(2)
                                        Button(action: { selectPlayerSecondCard() }, label: { playerSecondCardFace} )
                                            .scaleEffect(2)
                                        Button(action: { selectPlayerThirdCard() }, label: { playerThirdCardFace} )
                                            .scaleEffect(2)
                                        Button(action: { selectPlayerFourthCard() }, label: { playerFourthCardFace} )
                                        .scaleEffect(2) }
                                    .padding(.leading)   // End of Player Area
                                    .buttonStyle(PlayerHandButton())
                                    VStack()    {
                                        Spacer()
                                        HStack()    {   // Player and Opponent Table
                                            Spacer()
                                            VStack  {   // Player Table
                                                Button(action: { /*playCard()*/ }, label: { /*p1*/playerGameboard[0].Image } )
                                                Button(action: { /*playCard()*/ }, label: { /*p4*/playerGameboard[3].Image } )
                                                Button(action: { /*playCard()*/ }, label: { /*p7*/playerGameboard[6].Image } )
                                            }   // End of Player Table
                                            VStack  {   // Player Table
                                                Button(action: { /*playCard()*/ }, label: { /*p2*/playerGameboard[1].Image } )
                                                Button(action: { /*playCard()*/ }, label: { /*p5*/playerGameboard[4].Image } )
                                                Button(action: { /*playCard()*/ }, label: { /*p8*/playerGameboard[7].Image } )
                                            }   // End of Player Table
                                            VStack  {   // Player Table
                                                Button(action: { /*playCard()*/ }, label: { /*p3*/playerGameboard[2].Image } )
                                                Button(action: { /*playCard()*/ }, label: { /*p6*/playerGameboard[5].Image } )
                                                Button(action: { /*playCard()*/ }, label: { /*p9*/playerGameboard[8].Image } )
                                            }   // End of Player Table
                                            Spacer()
                                            VStack  {   // Opponent Table
                                                Button(action: { /*playCard()*/ }, label: { /*o3*/opponentGameboard[2].Image } )
                                                Button(action: { /*playCard()*/ }, label: { /*o6*/opponentGameboard[5].Image } )
                                                Button(action: { /*playCard()*/ }, label: { /*o9*/opponentGameboard[8].Image } )
                                            }   // End of Player Table
                                            VStack  {   // Player Table
                                                Button(action: { /*playCard()*/ }, label: { /*o2*/opponentGameboard[1].Image } )
                                                Button(action: { /*playCard()*/ }, label: { /*o5*/opponentGameboard[4].Image } )
                                                Button(action: { /*playCard()*/ }, label: { /*o8*/opponentGameboard[7].Image } )
                                            }   // End of Player Table
                                            VStack  {   // Player Table
                                                Button(action: { /*playCard()*/ }, label: { /*o1*/opponentGameboard[0].Image } )
                                                Button(action: { /*playCard()*/ }, label: { /*o4*/opponentGameboard[3].Image } )
                                                Button(action: { /*playCard()*/ }, label: { /*o7*/opponentGameboard[6].Image } )
                                            }   // End of Player and Opponent Table
                                            Spacer()    }   // End of HStack
                                        .buttonStyle(GameboardButton())
                                        Spacer()    }   // End of VStack
                                    
                                    VStack  {   // Opponent
                                        Button(action: { selectOpponentFirstCard() }, label: { opponentFirstCardFace } )
                                            .scaleEffect(2)
                                        Button(action: { selectOpponentSecondCard() }, label: { opponentSecondCardFace } )
                                            .scaleEffect(2)
                                        Button(action: { selectOpponentThirdCard() }, label: { opponentThirdCardFace } )
                                            .scaleEffect(2)
                                        Button(action: { selectOpponentFourthCard() }, label: { opponentFourthCardFace} )
                                        .scaleEffect(2) }
                                    .padding(.trailing)
                                    .buttonStyle(OpponentHandButton())  }   // End of Player Area
                                Spacer()
                                HStack() {  Spacer()
                                    // Hit Button
                                    Button(action:  {   print("Hit Button Tapped"); oneTurn(); })  {
                                        HStack()    {
                                            Image(systemName: "arrow.clockwise.circle.fill")
                                                .renderingMode(.template)
                                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                                .foregroundColor(Color.offWhite)
                                                .padding(0.0)
                                                .frame(width: 0.0)
                                            Spacer()
                                            Text("HIT")
                                                .foregroundColor(Color.offWhite)
                                                .font(.largeTitle)
                                                .blendMode(/*@START_MENU_TOKEN@*/.hardLight/*@END_MENU_TOKEN@*/)
                                                .padding(.vertical, 10)
                                            .padding(.horizontal, 10)   }   }   // End of Hit Button
                                    
                                    .padding(.bottom)
                                    .buttonStyle(LightButtonStyle())
                                    .font(.largeTitle)
                                    Spacer()
                                    
                                    // Stand Button
                                    Button(action:  {   print("Stand Button Tapped"); stand();   })  {
                                        HStack()    {
                                            Image(systemName: "xmark.circle.fill")
                                                .renderingMode(.template)
                                                .aspectRatio(contentMode: .fill)
                                                .foregroundColor(Color.offWhite)
                                                .frame(width: 0.0)
                                            Spacer()
                                            Text("STAND")
                                                .foregroundColor(Color.offWhite)
                                                .font(.largeTitle)
                                                .blendMode(/*@START_MENU_TOKEN@*/.hardLight/*@END_MENU_TOKEN@*/)
                                                .padding(.vertical, 10)
                                            .padding(.horizontal, 10)   }   // End of Hstack
                                    }   // End of Stand button.
                                    .padding(.bottom)
                                    .buttonStyle(LightButtonStyle())
                                    .font(.largeTitle)
                                    Spacer()    }   // End of Bottom HStack
                                .buttonStyle(BlueButton())
                                .padding(30)
                                Spacer()
                            }}// End of ZStack
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)}
                }   // End of ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group { ContentView()   }   }   }
