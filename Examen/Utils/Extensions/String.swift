//
//  Strings.swift
//  Examen
//
//  Created by David Lopez on 14/11/22.
//

import Foundation

extension String {
    
    struct MovieDetail {
        static let urlPostr = "https://www.themoviedb.org/t/p/w1280/"
        static let urlPosterNoDisponible = "https://www.themoviedb.org/t/p/w1280/"
        static let Resumen = "Resumen: "
        static let Genero = "Genero: "
        static let TitleAvances = "Avances"
        static let TitleDetalles = "Acerca de esta película"
        
    }
    
    struct Profile {
        static let urlAvatar = "https://www.themoviedb.org/t/p/w300_and_h300_face/"
        static let Pais = "País: "
        static let Nombre = "Nombre: "
        static let At = "@"
        static let Title = "Perfil"
    }
    
    struct Login {
        static let Error401 = "Los datos ingresados no son correctos, por favor verifique su Usuario y/o Contraseña."
        static let CamposVacios = "Por favor ingrese su usuario y contraseña"
        static let Login = "Login"
        static let User = "Usuario"
        static let Password = "Contraseñas"
    }
    
    struct Home {
        static let VerPerfil = "Ver Perfil"
        static let Cancelar = "Cancelar"
        static let Logout = "Cerrar sesión"
        static let Popular = "Populares"
        static let Upcoming = "Proximos"
        static let ToRated = "Las mejores"
        
        
    }

}
