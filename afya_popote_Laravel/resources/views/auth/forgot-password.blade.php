<x-guest-layout>
    <x-jet-authentication-card>
        <x-slot name="logo">
            <x-jet-authentication-card-logo />
        </x-slot>

        <div class="mb-4 text-sm text-gray-600">
            {{ __('Forgot your password? No problem. still we are developing password reset link for now call 0655 551 379 your password will reset.') }}
        </div>

        @if (session('status'))
            <div class="mb-4 font-medium text-sm text-green-600">
                {{ session('status') }}
            </div>
        @endif

        <x-jet-validation-errors class="mb-4" />

        <!-- <form method="POST" action="{{ route('password.email') }}">
            @csrf

            <div class="block">
                <x-jet-label for="email" value="{{ __('Email') }}" />
                <x-jet-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')" required autofocus />
            </div>

            <div class="flex items-center justify-end mt-4">
                <x-jet-button>
                    {{ __('Email Password Reset Link') }}
                </x-jet-button>
            </div>
        </form> -->
        <div class="flex items-center justify-end mt-4">
        <x-jet-button class="ml-4">
                <a class="text-sm text-white-600 hover:text-white-900" href="{{ route('login') }}">
                    {{ __('Go back to login page') }}
                </a>

                </x-jet-button>
            </div>
    </x-jet-authentication-card>
</x-guest-layout>
