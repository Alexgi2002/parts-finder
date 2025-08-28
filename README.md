# 📱 Flutter App - Comparador de Precios de Piezas

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)](https://www.android.com/)
[![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)](https://www.apple.com/ios/)

Una aplicación móvil desarrollada con Flutter que consume la API de comparación de precios de piezas y componentes electrónicos, permitiendo a los usuarios buscar productos en múltiples tiendas y acceder directamente a las páginas de origen.

## ✨ Características

- **🔍 Búsqueda Inteligente**: Busca piezas en múltiples tiendas simultáneamente
- **📊 Comparación de Precios**: Visualiza y compara precios de diferentes retailers
- **🌐 Navegación Directa**: Accede directamente al producto en la tienda original
- **📱 Interfaz Intuitiva**: Diseño moderno y fácil de usar
- **⚡ Rendimiento Optimizado**: Carga rápida y experiencia fluida
- **🎨 Modo Oscuro/Claro**: Soporte para ambos temas visuales
- **📦 Resultados Detallados**: Información completa de cada producto


## 🚀 Instalación

### Prerrequisitos

- Flutter SDK 3.24+
- Dart 3.14+
- Android Studio o VS Code
- Dispositivo Android/iOS o emulador

### Pasos de instalación

1. **Clonar el repositorio**

```bash
git clone https://github.com/AlexGI2002/parts-finder.git
cd flutter-piezas-app
```

2. **Obtener dependencias**

```bash
flutter pub get
```

3. **Configurar API endpoint** (opcional)

```dart
// En lib/config/constants.dart
const String API_BASE_URL = "https://tu-api.com";
```

4. **Ejecutar la aplicación**

```bash
flutter run
```


## 🤝 Contribuir

Las contribuciones son bienvenidas. Por favor:

1. Fork el proyecto
2. Crea una rama: `git checkout -b feature/nueva-funcionalidad`
3. Commit tus cambios: `git commit -m 'Añadir nueva funcionalidad'`
4. Push a la rama: `git push origin feature/nueva-funcionalidad`
5. Abre un Pull Request

## ⚠️ Consideraciones

- La aplicación requiere conexión a internet para funcionar
- El rendimiento depende de la velocidad de respuesta de la API
- Algunas tiendas pueden requerir apps específicas para abrir enlaces

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.

## 🆘 Soporte

Si encuentras algún problema o tienes preguntas:

1. Revisa los [issues existentes](https://github.com/AlexGI2002/parts-finder/issues)
2. Crea un nuevo issue con detalles del problema
3. Proporciona capturas de pantalla y pasos para reproducir el error

## 📊 Estadísticas

![Versión Flutter](https://img.shields.io/badge/Flutter-3.24.4-blue)
![Versión Dart](https://img.shields.io/badge/Dart-2.18.0-blue)
![Último Commit](https://img.shields.io/github/last-commit/AlexGI2002/parts-finder)
![Estado del Proyecto](https://img.shields.io/badge/estado-activo-brightgreen)

---

**Nota**: Esta aplicación funciona junto con el [backend de scraping](https://github.com/AlexGI2002/parts-finder-backend) para proporcionar la funcionalidad completa de comparación de precios.
