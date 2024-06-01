function createTabbedGUI()
    % Ana figürü oluşturun
    f = figure('Position', [100, 100, 1000, 900], 'Name', 'Fourier Series and Sinus-Cosinus Analysis', 'NumberTitle', 'off');

    % Sekme grubunu oluşturun
    tabGroup = uitabgroup(f, 'Position', [0, 0, 1, 1]);

    % İlk sekmeyi oluşturun: Fourier Serisi
    tab1 = uitab(tabGroup, 'Title', 'Fourier Series');
    createFourierTab(tab1);

    % İkinci sekmeyi oluşturun: Sinüs ve Kosinus Sinyalleri
    tab2 = uitab(tabGroup, 'Title', 'Sinus and Cosinus Signals');
    createSineCosineTab(tab2);

    function createFourierTab(parent)
        % Fourier Series GUI components
        uicontrol('Parent', parent, 'Style', 'text', 'Position', [50, 850, 80, 25], 'String', 'a0:');
        a0_edit = uicontrol('Parent', parent, 'Style', 'edit', 'Position', [150, 850, 100, 25]);

        uicontrol('Parent', parent, 'Style', 'text', 'Position', [50, 820, 80, 25], 'String', 'a1:');
        a1_edit = uicontrol('Parent', parent, 'Style', 'edit', 'Position', [150, 820, 100, 25]);
        uicontrol('Parent', parent, 'Style', 'text', 'Position', [50, 790, 80, 25], 'String', 'b1:');
        b1_edit = uicontrol('Parent', parent, 'Style', 'edit', 'Position', [150, 790, 100, 25]);

        uicontrol('Parent', parent, 'Style', 'text', 'Position', [300, 820, 80, 25], 'String', 'a2:');
        a2_edit = uicontrol('Parent', parent, 'Style', 'edit', 'Position', [400, 820, 100, 25]);
        uicontrol('Parent', parent, 'Style', 'text', 'Position', [300, 790, 80, 25], 'String', 'b2:');
        b2_edit = uicontrol('Parent', parent, 'Style', 'edit', 'Position', [400, 790, 100, 25]);

        uicontrol('Parent', parent, 'Style', 'text', 'Position', [550, 820, 80, 25], 'String', 'a3:');
        a3_edit = uicontrol('Parent', parent, 'Style', 'edit', 'Position', [650, 820, 100, 25]);
        uicontrol('Parent', parent, 'Style', 'text', 'Position', [550, 790, 80, 25], 'String', 'b3:');
        b3_edit = uicontrol('Parent', parent, 'Style', 'edit', 'Position', [650, 790, 100, 25]);

        uicontrol('Parent', parent, 'Style', 'text', 'Position', [300, 850, 80, 25], 'String', 'w0:');
        w0_edit = uicontrol('Parent', parent, 'Style', 'edit', 'Position', [400, 850, 100, 25]);
        uicontrol('Parent', parent, 'Style', 'text', 'Position', [550, 850, 80, 25], 'String', 'T:');
        T_edit = uicontrol('Parent', parent, 'Style', 'edit', 'Position', [650, 850, 100, 25]);

        % Plot button
        uicontrol('Parent', parent, 'Style', 'pushbutton', 'Position', [350, 750, 100, 25], 'String', 'Plot', 'Callback', @plot_fourier_series);

        % Axes for plotting
        ax = axes('Parent', parent, 'Position', [0.2, 0.1, 0.63, 0.63]);

        % Callback function to plot the Fourier series
        function plot_fourier_series(~, ~)
            % Get user inputs
            a0 = str2double(get(a0_edit, 'String'));
            a1 = str2double(get(a1_edit, 'String'));
            b1 = str2double(get(b1_edit, 'String'));

            a2 = str2double(get(a2_edit, 'String'));
            b2 = str2double(get(b2_edit, 'String'));

            a3 = str2double(get(a3_edit, 'String'));
            b3 = str2double(get(b3_edit, 'String'));

            w0 = str2double(get(w0_edit, 'String'));
            T = str2double(get(T_edit, 'String'));

            % Time vector
            t = linspace(0, 4*T, 1000);

            % Calculate Fourier series
            y = a0 + a1*cos(1*w0*t) + b1*sin(1*w0*t) + a2*cos(2*w0*t) + b2*sin(2*w0*t) + a3*cos(3*w0*t) + b3*sin(3*w0*t);

            % Plot Fourier series
            plot(ax, t, y);
            title('Fourier Series Synthesis');
        end
    end

    function createSineCosineTab(parent)
        % Sinus and Cosinus Signals GUI components
        uicontrol('Parent', parent, 'Style', 'text', 'Position', [50, 850, 80, 25], 'String', 'Amplitude A1:');
        amp1 = uicontrol('Parent', parent, 'Style', 'edit', 'Position', [150, 850, 100, 25]);
        uicontrol('Parent', parent, 'Style', 'text', 'Position', [50, 820, 80, 25], 'String', 'Frequency f1:');
        freq1 = uicontrol('Parent', parent, 'Style', 'edit', 'Position', [150, 820, 100, 25]);
        uicontrol('Parent', parent, 'Style', 'text', 'Position', [50, 790, 80, 25], 'String', 'Phase θ1:');
        phase1 = uicontrol('Parent', parent, 'Style', 'edit', 'Position', [150, 790, 100, 25]);

        uicontrol('Parent', parent, 'Style', 'text', 'Position', [300, 850, 80, 25], 'String', 'Amplitude A2:');
        amp2 = uicontrol('Parent', parent, 'Style', 'edit', 'Position', [400, 850, 100, 25]);
        uicontrol('Parent', parent, 'Style', 'text', 'Position', [300, 820, 80, 25], 'String', 'Frequency f2:');
        freq2 = uicontrol('Parent', parent, 'Style', 'edit', 'Position', [400, 820, 100, 25]);
        uicontrol('Parent', parent, 'Style', 'text', 'Position', [300, 790, 80, 25], 'String', 'Phase θ2:');
        phase2 = uicontrol('Parent', parent, 'Style', 'edit', 'Position', [400, 790, 100, 25]);

        uicontrol('Parent', parent, 'Style', 'text', 'Position', [550, 850, 80, 25], 'String', 'Amplitude A3:');
        amp3 = uicontrol('Parent', parent, 'Style', 'edit', 'Position', [650, 850, 100, 25]);
        uicontrol('Parent', parent, 'Style', 'text', 'Position', [550, 820, 80, 25], 'String', 'Frequency f3:');
        freq3 = uicontrol('Parent', parent, 'Style', 'edit', 'Position', [650, 820, 100, 25]);
        uicontrol('Parent', parent, 'Style', 'text', 'Position', [550, 790, 80, 25], 'String', 'Phase θ3:');
        phase3 = uicontrol('Parent', parent, 'Style', 'edit', 'Position', [650, 790, 100, 25]);

        % Plot button
        uicontrol('Parent', parent, 'Style', 'pushbutton', 'Position', [850, 820, 100, 25], 'String', 'Plot', 'Callback', @plot_signals);

        % Axes for plotting
        ax1 = axes('Parent', parent, 'Position', [0.1, 0.70, 0.35, 0.10]);  % Sinyal 1 sin
        ax2 = axes('Parent', parent, 'Position', [0.55, 0.70, 0.35, 0.10]); % Sinyal 1 cos
        ax3 = axes('Parent', parent, 'Position', [0.1, 0.55, 0.35, 0.10]);  % Sinyal 1 toplam
        ax4 = axes('Parent', parent, 'Position', [0.1, 0.40, 0.35, 0.10]);  % Sinyal 2 sin
        ax5 = axes('Parent', parent, 'Position', [0.55, 0.40, 0.35, 0.10]); % Sinyal 2 cos
        ax6 = axes('Parent', parent, 'Position', [0.1, 0.25, 0.35, 0.10]);  % Sinyal 2 toplam
        ax7 = axes('Parent', parent, 'Position', [0.1, 0.10, 0.35, 0.10]);  % Sinyal 3 sin
        ax8 = axes('Parent', parent, 'Position', [0.55, 0.10, 0.35, 0.10]); % Sinyal 3 cos
        ax9 = axes('Parent', parent, 'Position', [0.1, 0.01, 0.35, 0.10]);  % Sinyal 3 toplam
        ax10 = axes('Parent', parent, 'Position', [0.55, 0.01, 0.35, 0.10]);% Sentezlenmiş toplam sinyal

        % Callback function to plot the signals
        function plot_signals(~, ~)
            % Get user inputs
            A1 = str2double(get(amp1, 'String'));
            f1 = str2double(get(freq1, 'String'));
            theta1 = str2double(get(phase1, 'String'));

            A2 = str2double(get(amp2, 'String'));
            f2 = str2double(get(freq2, 'String'));
            theta2 = str2double(get(phase2, 'String'));

            A3 = str2double(get(amp3, 'String'));
            f3 = str2double(get(freq3, 'String'));
            theta3 = str2double(get(phase3, 'String'));

            % Time vector
            t = linspace(0, 1, 1000);

            % Generate signals
            y1_sin = A1 * sin(2*pi*f1*t + deg2rad(theta1));
            y1_cos = A1 * cos(2*pi*f1*t + deg2rad(theta1));
            y1_total = y1_sin + y1_cos;
            
            y2_sin = A2 * sin(2*pi*f2*t + deg2rad(theta2));
            y2_cos = A2 * cos(2*pi*f2*t + deg2rad(theta2));
            y2_total = y2_sin + y2_cos;

            y3_sin = A3 * sin(2*pi*f3*t + deg2rad(theta3));
            y3_cos = A3 * cos(2*pi*f3*t + deg2rad(theta3));
            y3_total = y3_sin + y3_cos;

            % Plot individual signals and their totals
            axes(ax1);
            plot(t, y1_sin);
            title(['Signal 1: Sine Component (A1=' num2str(A1) ', f1=' num2str(f1) ', θ1=' num2str(theta1) ')']);

            axes(ax2);
            plot(t, y1_cos);
            title(['Signal 1: Cosine Component (A1=' num2str(A1) ', f1=' num2str(f1) ', θ1=' num2str(theta1) ')']);
            
            axes(ax3);
            plot(t, y1_total);
            title('Signal 1: Total');

            axes(ax4);
            plot(t, y2_sin);
            title(['Signal 2: Sine Component (A2=' num2str(A2) ', f2=' num2str(f2) ', θ2=' num2str(theta2) ')']);

            axes(ax5);
            plot(t, y2_cos);
            title(['Signal 2: Cosine Component (A2=' num2str(A2) ', f2=' num2str(f2) ', θ2=' num2str(theta2) ')']);
            
            axes(ax6);
            plot(t, y2_total);
            title('Signal 2: Total');

            axes(ax7);
            plot(t, y3_sin);
            title(['Signal 3: Sine Component (A3=' num2str(A3) ', f3=' num2str(f3) ', θ3=' num2str(theta3) ')']);

            axes(ax8);
            plot(t, y3_cos);
            title(['Signal 3: Cosine Component (A3=' num2str(A3) ', f3=' num2str(f3) ', θ3=' num2str(theta3) ')']);
            
            axes(ax9);
            plot(t, y3_total);
            title('Signal 3: Total');

            % Plot total signal (sum of all components)
            y_sum = y1_total + y2_total + y3_total;

            axes(ax10);
            plot(t, y_sum);
            title('Synthesized Total Signal');
        end
    end
end
