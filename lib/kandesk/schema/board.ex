defmodule Kandesk.Schema.Board do
  use Ecto.Schema
  import Ecto.Changeset

  schema "boards" do
    field :name, :string
    field :descr, :string
    field :token, :string
    field :is_active, :boolean
    field :is_public, :boolean
    belongs_to :creator, Kandesk.Schema.User

    timestamps()
  end

  def changeset(struct, attrs) do
    struct
    |> cast(attrs, [:name, :descr, :token, :is_active, :is_public, :creator_id])
    |> validate_required([:name, :token, :is_active, :is_public, :creator_id])
  end

end
