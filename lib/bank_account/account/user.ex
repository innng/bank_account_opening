defmodule BankAccount.Account.User do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :birth_date, :date
    field :city, :binary
    field :country, :binary
    field :cpf, :binary, null: false
    field :email, :binary
    field :gender, :binary
    field :is_completed, :boolean, default: false
    field :name, :binary
    field :referral_code, :integer
    field :state, :binary

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :name,
      :email,
      :cpf,
      :birth_date,
      :gender,
      :city,
      :state,
      :country,
      :referral_code,
      :is_completed
    ])
    |> validate_required([:cpf])
  end
end
