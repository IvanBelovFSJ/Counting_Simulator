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

extension LinearGradient    {   init(_ Colors: Color...) {
        self.init(gradient: Gradient(colors: Colors),startPoint:.topLeading,endPoint:.bottomTrailing)}}

/* Sets of immutable positive(red) and negative(blue) cards from 1 to 9. */
var card: [String: Image] = [:]
var tupleCard: [String: (Value: Int, Image: Image, Path: String)] = [:]
var dealerCardP: [(Taken: Bool, Image: Image, Value: Int)] = []
var dealerCardM: [(Taken: Bool, Image: Image, Value: Int)] = []
var dealerCards: [(Taken: Bool, Image: Image, Value: Int)] = []
var deck: [(Taken: Bool, Image: Image, Value: Int)] = []
var tuplePlayerHand: [(Taken: Bool, Image: Image, Value: Int, Path: String)] = []
var tupleOpponentHand: [(Taken: Bool, Image: Image, Value: Int, Path: String)] = []

/* These eighteen tuples represent a gameboard of eighteen cells(spots). */
var tupleP: [(Taken: Bool, Image: Image)] = []
var tupleO: [(Taken: Bool, Image: Image)] = []

/* Keeping track of opponent and player gameboards. */
var playerGameboard: [(Taken: Bool, Image: Image)] = []
var opponentGameboard: [(Taken: Bool, Image: Image)] = []

/* These eighteen images represent a gameboard of eighteen cells(spots). */
let playerSpots: [Image] = (1...9).map { _ in Image("cardSpot")}
let opponentSpots: [Image] = (1...9).map { _ in Image("cardSpot")}

/* Cards suits for a player and an opponent. */
let cardSpot:Image = Image("cardSpot")
let opponentCardSuit:Image = Image("opponentCardsBackDesign")

/* Below arrays facilitate hands for both players. */
let interImage:Image = Image("")

/* Ten card deck for a player. Four cards used as a hand. */
var playersHand:[Int] = []
var playerPlayingHand:[Int] = []
var playerHand : [(Taken: Bool, Image: Image, Value: Int, Path: String)] = []

var opponentsHand:[Int] = []
var opponentPlayingHand:[Int] = []
var opponentHand : [(Taken: Bool, Image: Image, Value: Int, Path: String)] = []

var positionPlayerHand:[Int] = []
var positionPlayerPlayingHand:[Int] = []
var positionOpponentHand:[Int] = []
var positionOpponentPlayingHand:[Int] = []

var interCard = 0;

/* Various logic switches. */
var opponenetHandSwitch = Array(repeating: false, count: 4)
var playerHandSwitch = Array(repeating: false, count: 4)

var turnCount = 0;

/* Main method */
struct ContentView: View {
    
    init() {
        for i in 1...9 {
            card["P\(i)"] = Image("Card_Plus_\(i)")
            card["M\(i)"] = Image("Card_Minus_\(i)")
            if let img = card["P\(i)"] {
                tupleCard["P\(i)"] = (Value: i, Image: img, Path:"Card_Plus_\(i)")  }
            if let img = card["M\(i)"] {
                tupleCard["M\(i)"] = (Value: -i, Image: img, Path:"Card_Minus_\(i)")    }   }
        
        dealerCardP = Array(repeating: (Taken: false, Image: Image("placeholder"), Value: 0), count: 9)
        dealerCardM = Array(repeating: (Taken: false, Image: Image("placeholder"), Value: 0), count: 9)
        
        for i in 0...8 {
            if let img = card["P\(i)"] {
                dealerCardP[i] = (Taken: false, Image: img, Value: i)
                dealerCards.append(dealerCardP[i])
                deck.append(dealerCardP[i]) }
            if let img = card["M\(i)"] {
                dealerCardM[i] = (Taken: false, Image: img, Value: -i)
                dealerCards.append(dealerCardM[i])
                deck.append(dealerCardM[i]) }
            if let img = card["P\(i+1)"] {
                tupleP.append((Taken: false, Image: img))   }
            if let img = card["M\(i+1)"] {
                tupleO.append((Taken: false, Image: img))   }   }
        
            tuplePlayerHand = Array(repeating: (Taken: false, Image: interImage, Value: 0, Path: ""), count: 4)
            tupleOpponentHand = Array(repeating: (Taken: false, Image: interImage, Value: 0, Path: ""), count: 4)
            playerGameboard = Array(repeating: (Taken: false, Image: cardSpot), count: 9)
            opponentGameboard = Array(repeating: (Taken: false, Image: cardSpot), count: 9)
            
            for i in 0..<4 {
                tuplePlayerHand[i] = (Taken: false, Image: interImage, Value: 0, Path: "")
                tupleOpponentHand[i] = (Taken: false, Image: interImage, Value: 0, Path: "")    }
    }   // Enf of init()
    
    @State var playerColors: [Color] = [.gray, .gray, .gray]
    @State var opponentColors: [Color] = [.gray, .gray, .gray]

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
    @State private var isPlayerTurn = false
    @State private var playerHasActed = false
    @State private var targetScore = 21
    @State private var roundsCount = 0
    @State private var playerScore: Int = 0
    @State private var opponentScore: Int = 0
    @State private var playerInterValue: [Int] = [0, 0, 0, 0]
    @State private var opponentInterValue: [Int] = [0, 0, 0, 0]
    @State private var playerCardFace: [Image] = [cardSpot, cardSpot, cardSpot, cardSpot]
    @State private var opponentCardFace: [Image] = [cardSpot, cardSpot, cardSpot, cardSpot]
    @State private var playerInterCard: [Image] = [cardSpot, cardSpot, cardSpot, cardSpot]
    @State private var opponentInterCard: [Image] = [cardSpot, cardSpot, cardSpot, cardSpot]
    
    func checkGameStatus() {
        print(" Executing Game Status Check Function ")
        
        guard roundsCount < 3 else { return } // max 3 rounds
        var playerWon = false
        var opponentWon = false
        
        if playerScore == targetScore { playerWon = true
        } else if opponentScore == targetScore {    opponentWon = true
        } else if playerScore > targetScore {   opponentWon = true
        } else if opponentScore > targetScore { playerWon = true    }
        
        if playerWon {
            print("You win a round")
            playerColors[roundsCount] = .green
            opponentColors[roundsCount] = .red
            roundsCount += 1
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
            turnCount = 0
        } else if opponentWon {
            print("Opponent wins a round")
            playerColors[roundsCount] = .red
            opponentColors[roundsCount] = .green
            roundsCount += 1
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
            turnCount = 0   }   }
    
    /* Placing a selected card from a hand onto a gameboard. */
    func selectPlayerFirstCard()   {
        guard isPlayerTurn else {return}
        while (playerHandSwitch[0] == false)    {
            for position in 0...playerGameboard.count  {
                if (playerGameboard[position].Taken == false)   {
                    playerGameboard[position].Image = playerInterCard[0]
                    playerGameboard[position].Taken = true
                    playerCardFace[0] = cardSpot
                    self.playerScore += playerInterValue[0]
                    playerInterValue[0] = 0
                    playerInterCard[0] = cardSpot
                    playerHandSwitch[0] = true
                    break   }   }   }
        playerHasActed = true
        isPlayerTurn = false
        checkGameStatus()
        nextTurn()  }
    
    func selectPlayerSecondCard()   {
        while (playerHandSwitch[1] == false)    {
            for position in 0...playerGameboard.count  {
                if (playerGameboard[position].Taken == false)   {
                    playerGameboard[position].Image = playerInterCard[1]
                    playerGameboard[position].Taken = true
                    playerCardFace[1] = cardSpot
                    self.playerScore += playerInterValue[1]
                    playerInterValue[1] = 0
                    playerInterCard[1] = cardSpot
                    playerHandSwitch[1] = true
                    break   }   }   }
                    checkGameStatus()   }
    
    func selectPlayerThirdCard()   {
        while (playerHandSwitch[2] == false)    {
            for position in 0...playerGameboard.count  {
                if (playerGameboard[position].Taken == false)   {
                    playerGameboard[position].Image = playerInterCard[2]
                    playerGameboard[position].Taken = true
                    playerCardFace[2] = cardSpot
                    self.playerScore += playerInterValue[2]
                    playerInterValue[2] = 0
                    playerInterCard[2] = cardSpot
                    playerHandSwitch[2] = true
                    break   }   }   }
                    checkGameStatus()   }
    
    func selectPlayerFourthCard()   {
        while (playerHandSwitch[3] == false)    {
            for position in 0...playerGameboard.count  {
                if (playerGameboard[position].Taken == false)   {
                    playerGameboard[position].Image = playerInterCard[3]
                    playerGameboard[position].Taken = true
                    playerCardFace[3] = cardSpot
                    self.playerScore += playerInterValue[3]
                    playerInterValue[3] = 0
                    playerInterCard[3] = cardSpot
                    playerHandSwitch[3] = true
                    break   }   }   }
                    checkGameStatus()   }
    
    func selectOpponentFirstCard()   {
        while (opponenetHandSwitch[0] == false)    {
            for position in 0...opponentGameboard.count  {
                if (opponentGameboard[position].Taken == false)   {
                    opponentGameboard[position].Image = opponentInterCard[0]
                    opponentGameboard[position].Taken = true
                    opponentCardFace[0] = cardSpot
                    self.opponentScore += opponentInterValue[0]
                    opponentInterValue[0] = 0
                    opponentInterCard[0] = cardSpot
                    opponenetHandSwitch[0] = true
                    break   }   }   }
                    checkGameStatus()   }
    
    func selectOpponentSecondCard()   {
        while (opponenetHandSwitch[1] == false)   {
            for position in 0...opponentGameboard.count  {
                if (opponentGameboard[position].Taken == false)   {
                    opponentGameboard[position].Image = opponentInterCard[1]
                    opponentGameboard[position].Taken = true
                    opponentCardFace[1] = cardSpot
                    self.opponentScore += opponentInterValue[1]
                    opponentInterValue[1] = 0
                    opponentInterCard[1] = cardSpot
                    opponenetHandSwitch[1] = true
                    break   }   }   }
                    checkGameStatus()   }
    
    func selectOpponentThirdCard()   {
        while (opponenetHandSwitch[2] == false)    {
            for position in 0...opponentGameboard.count  {
                if (opponentGameboard[position].Taken == false)   {
                    opponentGameboard[position].Image = opponentInterCard[2]
                    opponentGameboard[position].Taken = true
                    opponentCardFace[2] = cardSpot
                    self.opponentScore += opponentInterValue[2]
                    opponentInterValue[2] = 0
                    opponentInterCard[2] = cardSpot
                    opponenetHandSwitch[2] = true
                    break   }   }   }
                    checkGameStatus()   }
    
    func selectOpponentFourthCard()   {
        while (opponenetHandSwitch[3] == false)    {
            for position in 0...opponentGameboard.count  {
                if (opponentGameboard[position].Taken == false)   {
                    opponentGameboard[position].Image = opponentInterCard[3]
                    opponentGameboard[position].Taken = true
                    opponentCardFace[3] = cardSpot
                    self.opponentScore += opponentInterValue[3]
                    opponentInterValue[3] = 0
                    opponentInterCard[3] = cardSpot
                    opponenetHandSwitch[3] = true
                    break   }   }   }
                    checkGameStatus()   }
    
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
        
        // Reset game state
        playerScore = 0
        opponentScore = 0
        // Reset switches
        opponenetHandSwitch = Array(repeating: false, count: opponenetHandSwitch.count)
        playerHandSwitch = Array(repeating: false, count: opponenetHandSwitch.count)
        // Reset inter values, inter cards and card faces
        playerInterValue = playerInterValue.map { _ in 0 }
        opponentInterValue = opponentInterValue.map { _ in 0 }
        playerInterCard = playerInterValue.map { _ in cardSpot }
        opponentInterCard = opponentInterCard.map { _ in cardSpot }
        playerCardFace = playerCardFace.map { _ in cardSpot }
        opponentCardFace = opponentCardFace.map { _ in cardSpot }
        // Reset game board
        for position in 0...playerGameboard.count - 1 {
            playerGameboard[position].Taken = false
            playerGameboard[position].Image = cardSpot
            opponentGameboard[position].Taken = false
            opponentGameboard[position].Image = cardSpot    }
        // Reset Dealer's deck
        for everyCard in 0...dealerCards.count - 1 {
            dealerCards[everyCard].Taken = false    }   }
    
    func setUpInitialCardStates() {
        for i in 0..<playerInterValue.count {
            playerInterValue[i] = deck[positionPlayerPlayingHand[i]].Value
            opponentInterValue[i] = deck[positionOpponentPlayingHand[i]].Value
            playerCardFace[i] = deck[positionPlayerPlayingHand[i]].Image
            playerInterCard[i] = deck[positionPlayerPlayingHand[i]].Image
            opponentInterCard[i] = deck[positionOpponentPlayingHand[i]].Image   }
        opponentCardFace = opponentCardFace.map { _ in opponentCardSuit }   }

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
        }   while !playerPlayingHand.contains(playersHand[interCard]) && playerPlayingHand.capacity == 3 }  }
        
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
        }   while !opponentPlayingHand.contains(opponentsHand[interCard]) && opponentPlayingHand.capacity == 3  }   }
        
    /* Deals a card to both players from the dealer deck. */
                func dealerMove() {
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
                                            checkGameStatus()   }   // End of dealerMove()
    
                func opponentMove() {
                    let interScore = playerScore
                    // for every cell on the playboard.
                    for position in 0...opponentGameboard.count  {
                        // if one of those is not taken.
                        if (opponentGameboard[position].Taken == false)   {
                            // choose one card out of a hand of four cards.
                            let randomCardNum = Int.random(in: 0..<tupleOpponentHand.count)
                            // if a card was not yet played
                            if (tupleOpponentHand[randomCardNum].Taken == false)   {
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
                        else { nextTurn() } }
                    checkGameStatus()   }   // End of opponentMove()
    
            // Player's move.
            func playerMove()   {
                isPlayerTurn = true
                playerHasActed = false
                print("🧍 Player’s turn — choose Hit or Stand") }
    
                func startGame()    {
                    // Resetting game and rounds counters
                    roundsCount = 0
                    turnCount = 0
                    playerScore = 0
                    opponentScore = 0
                    // Reset progress indicators for both players
                    for i in 0..<3 {
                        playerColors[i] = .gray
                        opponentColors[i] = .gray } // End of for loop
                    // Initializing board and decks
                    resetGameBoardForGameOrRound()
                    initializePlayerDeckAndHand()
                    initializeOpponentDeckAndHand()
                    setUpInitialCardStates()
                    // Start the first round
                    nextRound() }   // End of startgame
                    
                    func nextRound()   {
                        if roundsCount >= 3 {
                            endGame()
                            return  }
                        turnCount+=1
                        turnCount = 0
                        print("🎯 Starting round \(roundsCount)")
                        // Reset or clear playboards for this round
                        // resetGameBoardForGameOrRound()
                        // Start the first turn of the round
                        nextTurn()  }  // End of nextRound
                
                func nextTurn(){
                    // Should a round continue
                    if isRoundOver() {
                        print("✅ Round \(roundsCount) finished.")
                        nextRound()
                        return  }
                    print("Turn \(turnCount + 1) begins")
                    dealerMove()
                    opponentMove()
                    playerMove()
                    checkGameStatus()
                    print("End of turn \(turnCount + 1)")
                    turnCount += 1  }   // End of nextTurn
                    
                func isRoundOver() -> Bool {
                    return playerScore >= targetScore || opponentScore >= targetScore   }
                
                func endGame() {
                    print("🏁 Game Over!")
                    if playerScore > opponentScore {    print("🎉 Player wins!")
                    } else if opponentScore > playerScore { print("🤖 Opponent wins!")
                    } else {    print("🤝 It’s a tie!") }   }
                
                    // Skipping or Standing a move
                func stand()    {
                    guard isPlayerTurn else {return}
                    dealerMove()
                    opponentMove()
                    print("standing")
                    playerHasActed = true
                    isPlayerTurn = false
                    nextTurn()  }   // End of stand()
                    
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
        Button("")   {  }.buttonStyle(RoundButtonPlayerOne(outcomeColor: playerColors[0]))
        Button("")   {  }.buttonStyle(RoundButtonPlayerTwo(outcomeColor: playerColors[1]))
        Button("")   {  }.buttonStyle(RoundButtonPlayerThree(outcomeColor: playerColors[2]))    }
                            Spacer()
    HStack()  {   // Opponent Score ( from right to left )
        Button("")   {  }.buttonStyle(RoundButtonOpponentThree(outcomeColor: opponentColors[2]))
        Button("")   {  }.buttonStyle(RoundButtonOpponentTwo(outcomeColor: opponentColors[1]))
        Button("")   {  }.buttonStyle(RoundButtonOpponentOne(outcomeColor: opponentColors[0]))  }   }
                                .padding(.all, 30.0)   // End of Players Scores
    HStack()    {   // Match Scores spaced out apart
                                    Button("\(playerScore)")    {   };
                                    Button("\(opponentScore)")  {   }   }
                                .padding(.horizontal)
                                .buttonStyle(CurrentScoreButton())
    HStack()  {   // Player Area
        VStack  {   // Player
            Button(action: { selectPlayerFirstCard() }, label: { playerCardFace[0] } ).scaleEffect(2)
            Button(action: { selectPlayerSecondCard() }, label: { playerCardFace[1] } ).scaleEffect(2)
            Button(action: { selectPlayerThirdCard() }, label: { playerCardFace[2] } ).scaleEffect(2)
            Button(action: { selectPlayerFourthCard() }, label: { playerCardFace[3] } ).scaleEffect(2) }
                                    .padding(.leading)   // End of Player Area
                                    .buttonStyle(PlayerHandButton())
        VStack()    {
                        Spacer()
    HStack()    {   // Player and Opponent Table
                        Spacer()
        VStack  {   // Player Table
            Button(action: { /*playCard()*/ }, label: { /*p1*/playerGameboard[0].Image } )
            Button(action: { /*playCard()*/ }, label: { /*p4*/playerGameboard[3].Image } )
            Button(action: { /*playCard()*/ }, label: { /*p7*/playerGameboard[6].Image } )  }
        VStack  {   // Player Table
            Button(action: { /*playCard()*/ }, label: { /*p2*/playerGameboard[1].Image } )
            Button(action: { /*playCard()*/ }, label: { /*p5*/playerGameboard[4].Image } )
            Button(action: { /*playCard()*/ }, label: { /*p8*/playerGameboard[7].Image } )  }
        VStack  {   // Player Table
            Button(action: { /*playCard()*/ }, label: { /*p3*/playerGameboard[2].Image } )
            Button(action: { /*playCard()*/ }, label: { /*p6*/playerGameboard[5].Image } )
            Button(action: { /*playCard()*/ }, label: { /*p9*/playerGameboard[8].Image } )  }
                        Spacer()
        VStack  {   // Opponent Table
            Button(action: { /*playCard()*/ }, label: { /*o3*/opponentGameboard[2].Image } )
            Button(action: { /*playCard()*/ }, label: { /*o6*/opponentGameboard[5].Image } )
            Button(action: { /*playCard()*/ }, label: { /*o9*/opponentGameboard[8].Image } )    }
        VStack  {   // Player Table
            Button(action: { /*playCard()*/ }, label: { /*o2*/opponentGameboard[1].Image } )
            Button(action: { /*playCard()*/ }, label: { /*o5*/opponentGameboard[4].Image } )
            Button(action: { /*playCard()*/ }, label: { /*o8*/opponentGameboard[7].Image } )    }
        VStack  {   // Player Table
            Button(action: { /*playCard()*/ }, label: { /*o1*/opponentGameboard[0].Image } )
            Button(action: { /*playCard()*/ }, label: { /*o4*/opponentGameboard[3].Image } )
            Button(action: { /*playCard()*/ }, label: { /*o7*/opponentGameboard[6].Image } )    }
                        Spacer()    }   // End of HStack
                                        .buttonStyle(GameboardButton())
                        Spacer()    }   // End of VStack
        VStack  {   // Opponent
            Button(action: { selectOpponentFirstCard() }, label: { opponentCardFace[0] } ).scaleEffect(2)
            Button(action: { selectOpponentSecondCard() }, label: { opponentCardFace[1] } ).scaleEffect(2)
            Button(action: { selectOpponentThirdCard() }, label: { opponentCardFace[2] } ).scaleEffect(2)
            Button(action: { selectOpponentFourthCard() }, label: { opponentCardFace[3] } ).scaleEffect(2) }
                                    .padding(.trailing)
                                    .buttonStyle(OpponentHandButton())  }   // End of Player Area
                        Spacer()
    HStack() {          Spacer()
                                    // Hit Button
                                    Button(action:  {   print("Hit Button Tapped"); nextTurn(); })  {
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
