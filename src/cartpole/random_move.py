import gym
from gym import envs

env = gym.make('CartPole-v1')

env.reset()

for i in range(100):

    done = False
    game_rew = 0

    while not done:
        action = env.action_space.sample()
        new_obs, rew, done, info = env.step(action)
        game_rew += rew
        env.render()

        if done:
            print('Episode %d finished, reward:%d' % (i, game_rew))
            env.reset()

env.close()
