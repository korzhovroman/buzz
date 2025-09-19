const functions = require("firebase-functions");
const axios = require("axios");

exports.fileProxy = functions.https.onCall(async (data, context) => {
  // Получаем URL и токен из данных, переданных из приложения
  const fileUrl = data.fileUrl;
  const authToken = data.authToken;

  // Проверяем, что данные пришли
  if (!fileUrl || !authToken) {
    throw new functions.https.HttpsError(
      "invalid-argument",
      "The function must be called with 'fileUrl' and 'authToken' arguments.",
    );
  }

  try {
    // Выполняем GET-запрос с помощью axios
    const response = await axios.get(fileUrl, {
      headers: {
        // Добавляем заголовок авторизации
        Authorization: `Bearer ${authToken}`,
      },
      // Важно: получаем ответ как массив байтов
      responseType: "arraybuffer",
    });

    // Конвертируем бинарные данные в строку Base64
    const base64Data = Buffer.from(response.data, "binary").toString("base64");

    // Возвращаем данные и тип контента обратно в приложение
    return {
      fileContents: base64Data,
      contentType: response.headers["content-type"],
    };
  } catch (error) {
    console.error("Error fetching file:", error);
    throw new functions.https.HttpsError(
      "internal",
      "Failed to fetch the file.",
    );
  }
});
