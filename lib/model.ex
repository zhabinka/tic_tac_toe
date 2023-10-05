defmodule TicTacToe.Model do
  @type battle_status() :: :game_on | :game_off | :game_over

  @type sign() :: :cross | :zero
  @type cell() :: sign() | :f
  @type row() :: {cell(), cell(), cell()}
  @type battle_field() :: {row(), row(), row()}

  defmodule User do
    @type t() :: %__MODULE__{
            id: pos_integer(),
            name: String.t(),
            sign: Model.sign()
          }
    defstruct [:id, :name, :sign]
  end

  defmodule Battle do
    @type t() :: %__MODULE__{
            id: pos_integer(),
            sessions: [Session.t()],
            field: Model.battle_field(),
            opponent: Session.t(),
            current_move: Session.t(),
            status: Model.battle_status(),
            winner: User.t()
          }
    defstruct [:id, :sessions, :field, :opponent, :current_move, :status, :winner]
  end

  defmodule Session do
    @type t() :: %__MODULE__{
            session_pid: pid(),
            listening_socket: port(),
            socket: port(),
            user: User.t(),
            sign: Model.sign(),
            battle_pid: pid()
          }
    defstruct [:session_pid, :listening_socket, :socket, :user, :sign, :battle_pid]
  end
end
