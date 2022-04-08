//
//  GalaxyEnum.swift
//  Digital League CosmosProject
//
//  Created by Егор Астахов on 19.03.2022.
//

import UIKit

//MARK: - Enum
enum GalaxyName: String {
    case milkyWay = "Млечный путь"
    case messier54 = "Messier54"
    case andromedaNebula = "Туманность Андромеды"
    case triangleGalaxy = "Галактика Треугольника"
    case centauriA = "Центавр А"
    case messier105 = "Messier 105"
    case ngc4449 = "NGC 4449"
}

enum GalaxyFact: String {
    case milkyWay = """
 Млечный Путь — галактика, в которой находятся Земля, Солнечная система и все звёзды, видимые невооружённым глазом.

 Относится к спиральным галактикам с перемычкой.

 Млечный Путь вместе с галактикой Андромеды (M31), Треугольника (М33), и более 40 меньшими галактиками-спутниками образуют Местную Группу Галактик, которая, в свою очередь, входит в Сверхскопление Девы.
"""
    case messier54 = """
 Название этой небольшой галактики по каталогу звездного неба – Messier54. Она является спутником Млечного Пути.
 
 У крупных галактик есть более мелкие спутники – не такие масштабные, но тем не менее цельные объекты. Messier54 имеет радиус в 5000 св. лет. Для сравнения, наша галактика имеет радиус в 53 тыс. св. лет.

 Поглощение массивной звездной колыбелью менее массивной называется каннибализмом.

 Имеются предположения, что будут обнаружены более близкие скопления звезд, но на данный момент времени карликовая галактика в Стрельце ближе всего к нам.
 """
   case andromedaNebula = """
 Туманность Андромеды более чем в 2 раза больше нашей галактики. Ее диаметр составляет 220 тыс. св. лет. По количеству звезд она обгоняет нашу родную в 2-4 раза (около 1 трлн. звезд).

 По структуре аналогична Млечному Пути, т.е. также является спиральной с перемычкой. В спиралях расположены более молодые звезды, а в центре (на перемычке) находятся небольшие звезды (в основном карлики), которые значительно старше.

 В будущем (через 5 млрд. лет) она поглотит нашу галактику. Ей уже даже придумали название – Милкомеда.
"""
   case triangleGalaxy = """
 Спиральные галактики в чистом виде не имеют перемычки внутри. Рукава объекта плавно исходят из центра без видимых отклонений.
    
 Ближе всего к нам расположена галактика Треугольника. Диаметр объекта М33 составляет около 55 тыс. св. лет.
    
 В одном из рукавов формирования можно наблюдать туманность со скоплением огромных звезд (не менее 200). Это молодые светила очень редкого класса – гипергиганты. Они обладают колоссальной массой, светимостью, а также минимальным сроком жизни (несколько миллионов лет).

 Увидеть галактику Треугольника можно в безлунную ночь за городом невооруженным глазом.
"""
    case centauriA = """
 Это некий промежуточный тип между спиральными и эллиптическими галактиками. Поэтому их достаточно мало. Ближайшая к нам – галактика Центавр А. Является очень активной в радиочастотах. По диаметру растянулась на 60 тыс. св. лет.

 Для подобных звездных формирований свойственно отсутствие рукавов, а яркое центральное скопление сильно сжато, чем напоминает линзу.

 Состоят в основном из старых звезд, поэтому их оттенок красноватый. Практически не образуют новых светил.
"""
    case messier105 = """
 Messier 105 является образцовым примером галактик элиптического типа. Представляют собой со стороны некий круг или диск, яркость которого падает к границам.

 Состоят в основном такие звездные дома из старых объектов, так как в них давно прекратилось зведообразование.
"""
    case ngc4449 = """
 NGC 4449 – классический вариант иррационального звездоформирования.

 Неправильными называют галактики, которые имеют клочковатую, не идеальную форму. Такая структура позволяет сделать вывод: они содержат большое количество газа (до половины своей массы). Из-за этого в них идут бурные процессы образования новых звезд.

 Другими словами, эти галактики еще не приобрели окончательную форму, так как только недавно сформировались.

 Иная причина неправильной формы – столкновение с другим собратом. Но даже при столкновении часто понятно к какому типу относилась эта галактика до коллизии.
"""
}
