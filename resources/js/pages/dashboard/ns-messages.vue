<template>
    <div id="messages-wrapper">
        <div id="messages-button" @click="visible = !visible" :class="visible ? 'panel-visible border-0 shadow-lg' : 'border panel-hidden'" class="hover:shadow-lg hover:border-opacity-0 rounded-full h-12 w-12 cursor-pointer font-bold text-2xl justify-center items-center flex">
            <div class="relative float-right" v-if="unreadCount > 0">
                <div class="absolute -ml-6 -mt-8">
                    <div class="bg-red-500 text-white w-8 h-8 rounded-full text-xs flex items-center justify-center">{{ unreadCount > 99 ? '99+' : unreadCount }}</div>
                </div>
            </div>
            <i class="las la-envelope"></i>
        </div>
        <div class="h-0 w-0" v-if="visible" id="messages-center">
            <div class="absolute left-0 top-0 sm:relative w-screen zoom-out-entrance anim-duration-300 h-5/7-screen sm:w-80 sm:h-108 flex flex-row-reverse">
                <div class="z-50 sm:rounded-lg shadow-lg h-full w-full md:mt-2 overflow-y-hidden flex flex-col">
                    <!-- Header -->
                    <div class="p-3 border-b border-gray-200 flex items-center justify-between">
                        <h3 class="font-semibold text-lg">Messages</h3>
                        <div class="flex items-center space-x-2">
                            <button @click="showComposeModal = true" class="text-blue-500 hover:text-blue-700">
                                <i class="las la-plus text-xl"></i>
                            </button>
                            <button @click="visible = false" class="sm:hidden text-gray-500 hover:text-gray-700">
                                <i class="las la-times text-xl"></i>
                            </button>
                        </div>
                    </div>

                    <!-- Messages List -->
                    <div class="overflow-y-auto flex flex-col flex-auto">
                        <div :key="message.id" v-for="message of messages" class="message-card border-b hover:bg-gray-50 cursor-pointer" @click="openMessage(message)">
                            <div class="p-3">
                                <div class="flex items-start justify-between">
                                    <div class="flex-1 min-w-0">
                                        <div class="flex items-center space-x-2">
                                            <h4 class="font-medium text-sm truncate" :class="message.read_at ? 'text-gray-700' : 'text-black font-semibold'">
                                                {{ message.sender.username }}
                                            </h4>
                                            <i :class="message.priority_icon + ' ' + message.priority_color" class="text-xs"></i>
                                            <span v-if="message.type === 'report_request'" class="bg-blue-100 text-blue-800 text-xs px-2 py-1 rounded">Report</span>
                                        </div>
                                        <p class="text-sm text-gray-600 truncate mt-1" :class="message.read_at ? '' : 'font-medium'">
                                            {{ message.subject || message.message }}
                                        </p>
                                        <div class="flex items-center justify-between mt-2">
                                            <span class="text-xs text-gray-400">{{ timespan( message.created_at ) }}</span>
                                            <div v-if="!message.read_at" class="w-2 h-2 bg-blue-500 rounded-full"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div v-if="messages.length === 0" class="h-full w-full flex items-center justify-center">
                            <div class="flex flex-col items-center">
                                <i class="las la-envelope-open text-5xl text-gray-400"></i>
                                <p class="text-gray-500 text-sm mt-2">{{ __( 'No messages yet' ) }}</p>
                            </div>
                        </div>
                    </div>

                    <!-- Quick Actions -->
                    <div class="border-t border-gray-200 p-2">
                        <button @click="showReportRequestModal = true" class="w-full text-left px-3 py-2 text-sm text-blue-600 hover:bg-blue-50 rounded">
                            <i class="las la-chart-bar mr-2"></i>Request Sales Report
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Compose Message Modal -->
        <div v-if="showComposeModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50" @click="closeComposeModal">
            <div class="bg-white rounded-lg p-6 w-full max-w-md mx-4" @click.stop>
                <h3 class="text-lg font-semibold mb-4">Send Message</h3>
                <form @submit.prevent="sendMessage">
                    <div class="mb-4">
                        <label class="block text-sm font-medium mb-2">To:</label>
                        <select v-model="newMessage.recipient_id" class="w-full border rounded px-3 py-2" required>
                            <option value="">Select recipient...</option>
                            <option v-for="user in users" :key="user.id" :value="user.id">{{ user.username }}</option>
                        </select>
                    </div>
                    <div class="mb-4">
                        <label class="block text-sm font-medium mb-2">Subject:</label>
                        <input v-model="newMessage.subject" type="text" class="w-full border rounded px-3 py-2" placeholder="Optional subject">
                    </div>
                    <div class="mb-4">
                        <label class="block text-sm font-medium mb-2">Priority:</label>
                        <select v-model="newMessage.priority" class="w-full border rounded px-3 py-2">
                            <option value="low">Low</option>
                            <option value="normal">Normal</option>
                            <option value="high">High</option>
                            <option value="urgent">Urgent</option>
                        </select>
                    </div>
                    <div class="mb-4">
                        <label class="block text-sm font-medium mb-2">Message:</label>
                        <textarea v-model="newMessage.message" class="w-full border rounded px-3 py-2 h-24" placeholder="Type your message..." required></textarea>
                    </div>
                    <div class="flex justify-end space-x-2">
                        <button type="button" @click="closeComposeModal" class="px-4 py-2 text-gray-600 hover:text-gray-800">Cancel</button>
                        <button type="submit" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600" :disabled="sending">
                            {{ sending ? 'Sending...' : 'Send' }}
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Report Request Modal -->
        <div v-if="showReportRequestModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50" @click="closeReportRequestModal">
            <div class="bg-white rounded-lg p-6 w-full max-w-md mx-4" @click.stop>
                <h3 class="text-lg font-semibold mb-4">Request Sales Report</h3>
                <form @submit.prevent="sendReportRequest">
                    <div class="mb-4">
                        <label class="block text-sm font-medium mb-2">To:</label>
                        <select v-model="reportRequest.recipient_id" class="w-full border rounded px-3 py-2" required>
                            <option value="">Select recipient...</option>
                            <option v-for="user in users" :key="user.id" :value="user.id">{{ user.username }}</option>
                        </select>
                    </div>
                    <div class="mb-4">
                        <label class="block text-sm font-medium mb-2">Report Type:</label>
                        <select v-model="reportRequest.report_type" class="w-full border rounded px-3 py-2" required>
                            <option value="daily">Daily Report</option>
                            <option value="weekly">Weekly Report</option>
                            <option value="monthly">Monthly Report</option>
                            <option value="custom">Custom Date Range</option>
                        </select>
                    </div>
                    <div v-if="reportRequest.report_type === 'custom'" class="mb-4 space-y-2">
                        <div>
                            <label class="block text-sm font-medium mb-1">From Date:</label>
                            <input v-model="reportRequest.date_from" type="date" class="w-full border rounded px-3 py-2" required>
                        </div>
                        <div>
                            <label class="block text-sm font-medium mb-1">To Date:</label>
                            <input v-model="reportRequest.date_to" type="date" class="w-full border rounded px-3 py-2" required>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label class="block text-sm font-medium mb-2">Additional Message:</label>
                        <textarea v-model="reportRequest.message" class="w-full border rounded px-3 py-2 h-20" placeholder="Optional additional details..."></textarea>
                    </div>
                    <div class="flex justify-end space-x-2">
                        <button type="button" @click="closeReportRequestModal" class="px-4 py-2 text-gray-600 hover:text-gray-800">Cancel</button>
                        <button type="submit" class="px-4 py-2 bg-green-500 text-white rounded hover:bg-green-600" :disabled="sending">
                            {{ sending ? 'Sending...' : 'Send Request' }}
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Message Detail Modal -->
        <div v-if="selectedMessage" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50" @click="closeMessageDetail">
            <div class="bg-white rounded-lg p-6 w-full max-w-lg mx-4 max-h-96 overflow-y-auto" @click.stop>
                <div class="flex items-start justify-between mb-4">
                    <div>
                        <h3 class="text-lg font-semibold">{{ selectedMessage.subject || 'Message' }}</h3>
                        <p class="text-sm text-gray-600">From: {{ selectedMessage.sender.username }}</p>
                        <p class="text-xs text-gray-400">{{ timespan( selectedMessage.created_at ) }}</p>
                    </div>
                    <button @click="closeMessageDetail" class="text-gray-500 hover:text-gray-700">
                        <i class="las la-times text-xl"></i>
                    </button>
                </div>
                <div class="mb-4">
                    <p class="whitespace-pre-wrap">{{ selectedMessage.message }}</p>
                </div>
                <div v-if="selectedMessage.type === 'report_request' && selectedMessage.metadata" class="mb-4 p-3 bg-blue-50 rounded">
                    <h4 class="font-medium text-sm mb-2">Report Details:</h4>
                    <p class="text-sm">Type: {{ selectedMessage.metadata.report_type }}</p>
                    <p v-if="selectedMessage.metadata.date_from" class="text-sm">From: {{ selectedMessage.metadata.date_from }}</p>
                    <p v-if="selectedMessage.metadata.date_to" class="text-sm">To: {{ selectedMessage.metadata.date_to }}</p>
                </div>
                <div class="flex justify-end space-x-2">
                    <button @click="deleteMessage(selectedMessage)" class="px-4 py-2 text-red-600 hover:text-red-800">Delete</button>
                    <button @click="replyToMessage(selectedMessage)" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600">Reply</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { nsHttpClient, nsSnackBar } from '~/bootstrap';
import { __ } from '~/libraries/lang';
import { timespan } from '~/libraries/timespan';

export default {
    name: 'ns-messages',
    data() {
        return {
            messages: [],
            users: [],
            unreadCount: 0,
            visible: false,
            showComposeModal: false,
            showReportRequestModal: false,
            selectedMessage: null,
            sending: false,
            newMessage: {
                recipient_id: '',
                subject: '',
                message: '',
                priority: 'normal'
            },
            reportRequest: {
                recipient_id: '',
                report_type: 'daily',
                date_from: '',
                date_to: '',
                message: ''
            },
            interval: null,
        }
    },
    mounted() {
        document.addEventListener( 'click', this.checkClickedItem );
        
        this.loadMessages();
        this.loadUsers();
        this.loadUnreadCount();

        // Set up real-time updates
        if ( typeof Echo !== 'undefined' ) {
            Echo.private( `App.User.${ns.user.attributes.user_id}` )
                .listen( 'MessageReceived', ( event ) => {
                    this.loadMessages();
                    this.loadUnreadCount();
                });
        } else {
            // Fallback polling
            this.interval = setInterval( () => {
                this.loadMessages();
                this.loadUnreadCount();
            }, 30000 );
        }
    },
    unmounted() {
        if (this.interval) {
            clearInterval( this.interval );
        }
    },
    methods: {
        __,
        timespan,

        checkClickedItem( event ) {
            let clickChildrens;

            if ( document.getElementById( 'messages-center' ) ) {
                clickChildrens = document.getElementById( 'messages-center' )?.contains( event.target );
            } else {
                clickChildrens = false;
            }
            
            const isMessagesButton = document.getElementById( 'messages-button' )?.contains( event.target );

            if ( ! clickChildrens && ! isMessagesButton && this.visible ) {
                this.visible = false;
            }
        },

        loadMessages() {
            nsHttpClient.get( '/api/messages' )
                .subscribe( 
                    (response) => {
                        this.messages = response.data;
                    },
                    (error) => {
                        console.error('Failed to load messages:', error);
                    }
                );
        },

        loadUsers() {
            nsHttpClient.get( '/api/messages/users' )
                .subscribe( 
                    (users) => {
                        this.users = users;
                    },
                    (error) => {
                        console.error('Failed to load users:', error);
                    }
                );
        },

        loadUnreadCount() {
            nsHttpClient.get( '/api/messages/unread-count' )
                .subscribe( 
                    (response) => {
                        this.unreadCount = response.count;
                    },
                    (error) => {
                        console.error('Failed to load unread count:', error);
                    }
                );
        },

        sendMessage() {
            this.sending = true;
            nsHttpClient.post( '/api/messages', this.newMessage )
                .subscribe( 
                    (response) => {
                        nsSnackBar.success( response.message ).subscribe();
                        this.closeComposeModal();
                        this.loadMessages();
                        this.sending = false;
                    },
                    (error) => {
                        nsSnackBar.error( error.message || 'Failed to send message' ).subscribe();
                        this.sending = false;
                    }
                );
        },

        sendReportRequest() {
            this.sending = true;
            nsHttpClient.post( '/api/messages/report-request', this.reportRequest )
                .subscribe( 
                    (response) => {
                        nsSnackBar.success( response.message ).subscribe();
                        this.closeReportRequestModal();
                        this.loadMessages();
                        this.sending = false;
                    },
                    (error) => {
                        nsSnackBar.error( error.message || 'Failed to send report request' ).subscribe();
                        this.sending = false;
                    }
                );
        },

        openMessage( message ) {
            this.selectedMessage = message;
            if ( message.read_at === null ) {
                this.markAsRead( message );
            }
        },

        markAsRead( message ) {
            nsHttpClient.put( `/api/messages/${message.id}/read` )
                .subscribe( 
                    () => {
                        message.read_at = new Date().toISOString();
                        this.loadUnreadCount();
                    },
                    (error) => {
                        console.error('Failed to mark message as read:', error);
                    }
                );
        },

        deleteMessage( message ) {
            if ( window.confirm( 'Are you sure you want to delete this message?' ) ) {
                nsHttpClient.delete( `/api/messages/${message.id}` )
                    .subscribe( 
                        (response) => {
                            nsSnackBar.success( response.message ).subscribe();
                            this.closeMessageDetail();
                            this.loadMessages();
                            this.loadUnreadCount();
                        },
                        (error) => {
                            nsSnackBar.error( 'Failed to delete message' ).subscribe();
                        }
                    );
            }
        },

        replyToMessage( message ) {
            const subject = message.subject ? `Re: ${message.subject}` : 'Re: Message';
            this.newMessage = {
                recipient_id: message.sender_id,
                subject: subject,
                message: '',
                priority: 'normal'
            };
            this.closeMessageDetail();
            this.showComposeModal = true;
        },

        closeComposeModal() {
            this.showComposeModal = false;
            this.newMessage = {
                recipient_id: '',
                subject: '',
                message: '',
                priority: 'normal'
            };
        },

        closeReportRequestModal() {
            this.showReportRequestModal = false;
            this.reportRequest = {
                recipient_id: '',
                report_type: 'daily',
                date_from: '',
                date_to: '',
                message: ''
            };
        },

        closeMessageDetail() {
            this.selectedMessage = null;
        }
    }
}
</script>

<style scoped>
.message-card {
    transition: background-color 0.2s ease;
}

.panel-visible {
    @apply bg-blue-500 text-white;
}

.panel-hidden {
    @apply bg-white text-gray-700;
}
</style>
