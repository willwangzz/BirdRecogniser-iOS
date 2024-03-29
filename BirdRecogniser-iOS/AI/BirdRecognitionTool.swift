//
//  BirdRecognitionTool.swift
//  BirdRecogniser-iOS
//
//  Created by 王宗正 on 9/04/23.
//

import Foundation
import UIKit
import CoreML

struct BirdRecognisitionResult: Equatable, Hashable {
    
    let name: String
    let possibility: Float
    var information: String?
    
    func description() -> String {
        return "Bird name is \(name), the possibility is \(possibility)"
    }
}

class BirdRecognitionTool {
    
    static let shared = BirdRecognitionTool()
    
    private let recogniser = try! Bird_517_MobileNetV2_97(configuration: MLModelConfiguration())
    
    private init() {
    }
    
    func recognise(bird image: UIImage) async -> [BirdRecognisitionResult]? {
        guard let resizedImage = image.resize(to: .init(width: 224, height: 224))?.cgImage else { return nil }
        do {
            let recogniserInput = try Bird_517_MobileNetV2_97Input(input_2With: resizedImage)
            
            let result = try recogniser.prediction(input: recogniserInput)
            return self.formatResult(identity: result.Identity)
        }
        catch {
            return nil
        }
    }
    
    func formatResult(identity: MLMultiArray) -> [BirdRecognisitionResult] {
        var formattedResults = [BirdRecognisitionResult]()
        guard identity.count == BirdTypeNames.count else {
            return formattedResults
        }
        
        formattedResults = BirdTypeNames.enumerated().map { (index, name) in
            BirdRecognisitionResult(name: name, possibility: identity[index].floatValue)
        }
        
        formattedResults.sort { $0.possibility > $1.possibility }
        
        if let possibilit = formattedResults.first?.possibility, possibilit > 0.85 {
            return [formattedResults.first!]
        }
        
        let lastIndex = formattedResults.count >= 3 ? 2:formattedResults.count - 1
        return Array(formattedResults[0...lastIndex])
        
    }
}

private let BirdTypeNames = ["ABBOTTS BABBLER", "ABBOTTS BOOBY", "ABYSSINIAN GROUND HORNBILL", "AFRICAN CROWNED CRANE", "AFRICAN EMERALD CUCKOO", "AFRICAN FIREFINCH", "AFRICAN OYSTER CATCHER", "AFRICAN PIED HORNBILL", "AFRICAN PYGMY GOOSE", "ALBATROSS", "ALBERTS TOWHEE", "ALEXANDRINE PARAKEET", "ALPINE CHOUGH", "ALTAMIRA YELLOWTHROAT", "AMERICAN AVOCET", "AMERICAN BITTERN", "AMERICAN COOT", "AMERICAN FLAMINGO", "AMERICAN GOLDFINCH", "AMERICAN KESTREL", "AMERICAN PIPIT", "AMERICAN REDSTART", "AMERICAN ROBIN", "AMERICAN WIGEON", "AMETHYST WOODSTAR", "ANDEAN GOOSE", "ANDEAN LAPWING", "ANDEAN SISKIN", "ANHINGA", "ANIANIAU", "ANNAS HUMMINGBIRD", "ANTBIRD", "ANTILLEAN EUPHONIA", "APAPANE", "APOSTLEBIRD", "ARARIPE MANAKIN", "ASHY STORM PETREL", "ASHY THRUSHBIRD", "ASIAN CRESTED IBIS", "ASIAN DOLLARD BIRD", "ASIAN GREEN BEE EATER", "AUCKLAND SHAQ", "AUSTRAL CANASTERO", "AUSTRALASIAN FIGBIRD", "AVADAVAT", "AZARAS SPINETAIL", "AZURE BREASTED PITTA", "AZURE JAY", "AZURE TANAGER", "AZURE TIT", "BAIKAL TEAL", "BALD EAGLE", "BALD IBIS", "BALI STARLING", "BALTIMORE ORIOLE", "BANANAQUIT", "BAND TAILED GUAN", "BANDED BROADBILL", "BANDED PITA", "BANDED STILT", "BAR-TAILED GODWIT", "BARN OWL", "BARN SWALLOW", "BARRED PUFFBIRD", "BARROWS GOLDENEYE", "BAY-BREASTED WARBLER", "BEARDED BARBET", "BEARDED BELLBIRD", "BEARDED REEDLING", "BELTED KINGFISHER", "BIRD OF PARADISE", "BLACK AND YELLOW BROADBILL", "BLACK BAZA", "BLACK COCKATO", "BLACK FACED SPOONBILL", "BLACK FRANCOLIN", "BLACK HEADED CAIQUE", "BLACK NECKED STILT", "BLACK SKIMMER", "BLACK SWAN", "BLACK TAIL CRAKE", "BLACK THROATED BUSHTIT", "BLACK THROATED HUET", "BLACK THROATED WARBLER", "BLACK VENTED SHEARWATER", "BLACK VULTURE", "BLACK-CAPPED CHICKADEE", "BLACK-NECKED GREBE", "BLACK-THROATED SPARROW", "BLACKBIRD", "BLACKBURNIAM WARBLER", "BLONDE CRESTED WOODPECKER", "BLOOD PHEASANT", "BLUE COAU", "BLUE DACNIS", "BLUE DUCK(WHIO)", "BLUE GRAY GNATCATCHER", "BLUE GROSBEAK", "BLUE GROUSE", "BLUE HERON", "BLUE MALKOHA", "BLUE THROATED TOUCANET", "BOBOLINK", "BORNEAN BRISTLEHEAD", "BORNEAN LEAFBIRD", "BORNEAN PHEASANT", "BRANDT CORMARANT", "BREWERS BLACKBIRD", "BROWN CREPPER", "BROWN HEADED COWBIRD", "BROWN NOODY", "BROWN THRASHER", "BUFFLEHEAD", "BULWERS PHEASANT", "BURCHELLS COURSER", "BUSH TURKEY", "CAATINGA CACHOLOTE", "CACTUS WREN", "CALIFORNIA CONDOR", "CALIFORNIA GULL", "CALIFORNIA QUAIL", "CAMPO FLICKER", "CANARY", "CANVASBACK", "CAPE GLOSSY STARLING", "CAPE LONGCLAW", "CAPE MAY WARBLER", "CAPE ROCK THRUSH", "CAPPED HERON", "CAPUCHINBIRD", "CARMINE BEE-EATER", "CASPIAN TERN", "CASSOWARY", "CEDAR WAXWING", "CERULEAN WARBLER", "CHARA DE COLLAR", "CHATTERING LORY", "CHESTNET BELLIED EUPHONIA", "CHINESE BAMBOO PARTRIDGE", "CHINESE POND HERON", "CHIPPING SPARROW", "CHUCAO TAPACULO", "CHUKAR PARTRIDGE", "CINNAMON ATTILA", "CINNAMON FLYCATCHER", "CINNAMON TEAL", "CLARKS GREBE", "CLARKS NUTCRACKER", "COCK OF THE  ROCK", "COCKATOO", "COLLARED ARACARI", "COLLARED CRESCENTCHEST", "COMMON FIRECREST", "COMMON GRACKLE", "COMMON HOUSE MARTIN", "COMMON IORA", "COMMON LOON", "COMMON POORWILL", "COMMON STARLING", "COPPERSMITH BARBET", "COPPERY TAILED COUCAL", "CRAB PLOVER", "CRANE HAWK", "CREAM COLORED WOODPECKER", "CRESTED AUKLET", "CRESTED CARACARA", "CRESTED COUA", "CRESTED FIREBACK", "CRESTED KINGFISHER", "CRESTED NUTHATCH", "CRESTED OROPENDOLA", "CRESTED SERPENT EAGLE", "CRESTED SHRIKETIT", "CRESTED WOOD PARTRIDGE", "CRIMSON CHAT", "CRIMSON SUNBIRD", "CROW", "CROWNED PIGEON", "CUBAN TODY", "CUBAN TROGON", "CURL CRESTED ARACURI", "D-ARNAUDS BARBET", "DALMATIAN PELICAN", "DARJEELING WOODPECKER", "DARK EYED JUNCO", "DAURIAN REDSTART", "DEMOISELLE CRANE", "DOUBLE BARRED FINCH", "DOUBLE BRESTED CORMARANT", "DOUBLE EYED FIG PARROT", "DOWNY WOODPECKER", "DUSKY LORY", "DUSKY ROBIN", "EARED PITA", "EASTERN BLUEBIRD", "EASTERN BLUEBONNET", "EASTERN GOLDEN WEAVER", "EASTERN MEADOWLARK", "EASTERN ROSELLA", "EASTERN TOWEE", "EASTERN WIP POOR WILL", "EASTERN YELLOW ROBIN", "ECUADORIAN HILLSTAR", "EGYPTIAN GOOSE", "ELEGANT TROGON", "ELLIOTS  PHEASANT", "EMERALD TANAGER", "EMPEROR PENGUIN", "EMU", "ENGGANO MYNA", "EURASIAN BULLFINCH", "EURASIAN GOLDEN ORIOLE", "EURASIAN MAGPIE", "EUROPEAN GOLDFINCH", "EUROPEAN TURTLE DOVE", "EVENING GROSBEAK", "FAIRY BLUEBIRD", "FAIRY PENGUIN", "FAIRY TERN", "FAN TAILED WIDOW", "FANTAIL(PIWAKAWAKA)", "FASCIATED WREN", "FIERY MINIVET", "FIORDLAND PENGUIN", "FIRE TAILLED MYZORNIS", "FLAME BOWERBIRD", "FLAME TANAGER", "FOREST WAGTAIL", "FRIGATE", "FRILL BACK PIGEON", "GAMBELS QUAIL", "GANG GANG COCKATOO", "GILA WOODPECKER", "GILDED FLICKER", "GLOSSY IBIS", "GO AWAY BIRD", "GOLD WING WARBLER", "GOLDEN BOWER BIRD", "GOLDEN CHEEKED WARBLER", "GOLDEN CHLOROPHONIA", "GOLDEN EAGLE", "GOLDEN PARAKEET", "GOLDEN PHEASANT", "GOLDEN PIPIT", "GOULDIAN FINCH", "GRANDALA", "GRAY CATBIRD", "GRAY KINGBIRD", "GRAY PARTRIDGE", "GREAT ARGUS", "GREAT GRAY OWL", "GREAT JACAMAR", "GREAT KISKADEE", "GREAT POTOO", "GREAT TINAMOU", "GREAT XENOPS", "GREATER PEWEE", "GREATER PRAIRIE CHICKEN", "GREATOR SAGE GROUSE", "GREEN BROADBILL", "GREEN JAY", "GREEN MAGPIE", "GREEN WINGED DOVE", "GREY CUCKOOSHRIKE", "GREY HEADED FISH EAGLE", "GREY PLOVER", "GREY WARBLER", "GROVED BILLED ANI", "GUINEA TURACO", "GUINEAFOWL", "GURNEYS PITTA", "GYRFALCON", "HAMERKOP", "HARLEQUIN DUCK", "HARLEQUIN QUAIL", "HARPY EAGLE", "HAWAIIAN GOOSE", "HAWFINCH", "HELMET VANGA", "HEPATIC TANAGER", "HIMALAYAN BLUETAIL", "HIMALAYAN MONAL", "HOATZIN", "HOODED MERGANSER", "HOOPOES", "HORNED GUAN", "HORNED LARK", "HORNED SUNGEM", "HOUSE FINCH", "HOUSE SPARROW", "HYACINTH MACAW", "IBERIAN MAGPIE", "IBISBILL", "IMPERIAL SHAQ", "INCA TERN", "INDIAN BUSTARD", "INDIAN PITTA", "INDIAN ROLLER", "INDIAN VULTURE", "INDIGO BUNTING", "INDIGO FLYCATCHER", "INLAND DOTTEREL", "IVORY BILLED ARACARI", "IVORY GULL", "IWI", "JABIRU", "JACK SNIPE", "JACOBIN PIGEON", "JANDAYA PARAKEET", "JAPANESE ROBIN", "JAVA SPARROW", "JOCOTOCO ANTPITTA", "KAGU", "KAKAPO", "KEA", "KILLDEAR", "KING EIDER", "KING VULTURE", "KIWI", "KOOKABURRA", "LARK BUNTING", "LAUGHING GULL", "LAZULI BUNTING", "LESSER ADJUTANT", "LILAC ROLLER", "LIMPKIN", "LITTLE AUK", "LOGGERHEAD SHRIKE", "LONG-EARED OWL", "LOONEY BIRDS", "LUCIFER HUMMINGBIRD", "MAGPIE GOOSE", "MALABAR HORNBILL", "MALACHITE KINGFISHER", "MALAGASY WHITE EYE", "MALEO", "MALLARD DUCK", "MANDRIN DUCK", "MANGROVE CUCKOO", "MARABOU STORK", "MASKED BOBWHITE", "MASKED BOOBY", "MASKED LAPWING", "MCKAYS BUNTING", "MERLIN", "MIKADO  PHEASANT", "MILITARY MACAW", "MOREPORK(RURU)", "MOURNING DOVE", "MYNA", "NICOBAR PIGEON", "NOISY FRIARBIRD", "NORTHERN BEARDLESS TYRANNULET", "NORTHERN CARDINAL", "NORTHERN FLICKER", "NORTHERN FULMAR", "NORTHERN GANNET", "NORTHERN GOSHAWK", "NORTHERN JACANA", "NORTHERN MOCKINGBIRD", "NORTHERN PARULA", "NORTHERN RED BISHOP", "NORTHERN SHOVELER", "OCELLATED TURKEY", "OKINAWA RAIL", "ORANGE BRESTED BUNTING", "ORIENTAL BAY OWL", "ORNATE HAWK EAGLE", "OSPREY", "OSTRICH", "OVENBIRD", "OYSTER CATCHER", "PAINTED BUNTING", "PALILA", "PALM NUT VULTURE", "PARADISE TANAGER", "PARAKETT  AKULET", "PARUS MAJOR", "PATAGONIAN SIERRA FINCH", "PEACOCK", "PEREGRINE FALCON", "PHAINOPEPLA", "PHILIPPINE EAGLE", "PINK ROBIN", "PLUSH CRESTED JAY", "POMARINE JAEGER", "PUFFIN", "PUNA TEAL", "PURPLE FINCH", "PURPLE GALLINULE", "PURPLE MARTIN", "PURPLE SWAMPHEN", "PYGMY KINGFISHER", "PYRRHULOXIA", "QUETZAL", "RAINBOW LORIKEET", "RAZORBILL", "RED BEARDED BEE EATER", "RED BELLIED PITTA", "RED BILLED TROPICBIRD", "RED BROWED FINCH", "RED FACED CORMORANT", "RED FACED WARBLER", "RED FODY", "RED HEADED DUCK", "RED HEADED WOODPECKER", "RED KNOT", "RED LEGGED HONEYCREEPER", "RED NAPED TROGON", "RED SHOULDERED HAWK", "RED TAILED HAWK", "RED TAILED THRUSH", "RED WINGED BLACKBIRD", "RED WISKERED BULBUL", "REGENT BOWERBIRD", "RING-NECKED PHEASANT", "ROADRUNNER", "ROCK DOVE", "ROSE BREASTED COCKATOO", "ROSE BREASTED GROSBEAK", "ROSEATE SPOONBILL", "ROSY FACED LOVEBIRD", "ROUGH LEG BUZZARD", "ROYAL FLYCATCHER", "RUBY CROWNED KINGLET", "RUBY THROATED HUMMINGBIRD", "RUDDY SHELDUCK", "RUDY KINGFISHER", "RUFOUS KINGFISHER", "RUFOUS TREPE", "RUFUOS MOTMOT", "SAMATRAN THRUSH", "SAND MARTIN", "SANDHILL CRANE", "SATYR TRAGOPAN", "SAYS PHOEBE", "SCARLET CROWNED FRUIT DOVE", "SCARLET FACED LIOCICHLA", "SCARLET IBIS", "SCARLET MACAW", "SCARLET TANAGER", "SHOEBILL", "SHORT BILLED DOWITCHER", "SMITHS LONGSPUR", "SNOW GOOSE", "SNOWY EGRET", "SNOWY OWL", "SNOWY PLOVER", "SORA", "SPANGLED COTINGA", "SPLENDID WREN", "SPOON BILED SANDPIPER", "SPOTTED CATBIRD", "SPOTTED WHISTLING DUCK", "SQUACCO HERON", "SRI LANKA BLUE MAGPIE", "STEAMER DUCK", "STORK BILLED KINGFISHER", "STRIATED CARACARA", "STRIPED OWL", "STRIPPED MANAKIN", "STRIPPED SWALLOW", "SUNBITTERN", "SUPERB STARLING", "SURF SCOTER", "SWINHOES PHEASANT", "TAILORBIRD", "TAIWAN MAGPIE", "TAKAHE", "TASMANIAN HEN", "TAWNY FROGMOUTH", "TEAL DUCK", "TIT MOUSE", "TOUCHAN", "TOWNSENDS WARBLER", "TREE SWALLOW", "TRICOLORED BLACKBIRD", "TROPICAL KINGBIRD", "TRUMPTER SWAN", "TUI", "TURKEY VULTURE", "TURQUOISE MOTMOT", "UMBRELLA BIRD", "VARIED THRUSH", "VEERY", "VENEZUELIAN TROUPIAL", "VERDIN", "VERMILION FLYCATHER", "VICTORIA CROWNED PIGEON", "VIOLET BACKED STARLING", "VIOLET GREEN SWALLOW", "VIOLET TURACO", "VISAYAN HORNBILL", "VULTURINE GUINEAFOWL", "WALL CREAPER", "WATTLED CURASSOW", "WATTLED LAPWING", "WHIMBREL", "WHITE BREASTED WATERHEN", "WHITE BROWED CRAKE", "WHITE CHEEKED TURACO", "WHITE CRESTED HORNBILL", "WHITE EARED HUMMINGBIRD", "WHITE NECKED RAVEN", "WHITE TAILED TROPIC", "WHITE THROATED BEE EATER", "WILD TURKEY", "WILLOW PTARMIGAN", "WILSONS BIRD OF PARADISE", "WOOD DUCK", "WOOD THRUSH", "WOODLAND KINGFISHER", "WRENTIT", "YELLOW BELLIED FLOWERPECKER", "YELLOW CACIQUE", "YELLOW HEADED BLACKBIRD", "ZEBRA DOVE"]
