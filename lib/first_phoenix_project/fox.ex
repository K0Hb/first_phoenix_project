defmodule FirstPhoenixProject.Fox do

  def get_image_fox() do
    result = "https://randomfox.ca/floof/" |> HTTPoison.get |> parse_response

    case result do
      {:ok, image} -> image
      _ -> "Не удалось получить фото лисы."
    end
  end

  defp parse_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body |> Jason.decode! |> pull_image
  end

  defp parse_response(_), do: :error

  defp pull_image(%{"image" => image}), do: {:ok, image}
  defp pull_image(_), do: :error
end
