defmodule TicTacToe.Sessions do
  require Logger

  defmodule Session do
    use GenServer

    defmodule State do
      defstruct [
        :session_id,
        :listening_socket,
        :socket,
        :user
      ]
    end

    def start_link({session_id, listening_socket, process_name}) do
      GenServer.start_link(__MODULE__, {session_id, listening_socket}, name: process_name)
    end

    @impl true
    def init({session_id, listening_socket}) do
      # battle = TicTacToe.Game.BattleManager.start_battle(session_id)
      state = %State{
        session_id: session_id,
        listening_socket: listening_socket
      }

      Logger.info("Session #{session_id} has started, state #{inspect(state)}")
      {:ok, state}
    end
  end
end
