defmodule HelloEcto.User do
  use HelloEcto.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :bio, :string
    field :number_of_pets, :integer

    has_many :videos, HelloEcto.Video

    timestamps()
  end

  @required_fields ~w(name email bio)
  @optional_fields ~w(number_of_pets)
  
  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :bio, :number_of_pets])
    |> validate_required([:name, :email, :bio])
    |> validate_length(:bio, min: 2)
    |> validate_length(:bio, max: 10)
    |> validate_format(:email, ~r/@/)
  end
end
